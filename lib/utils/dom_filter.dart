import 'package:dom_builder/dom_builder.dart';
import 'package:flutter/cupertino.dart';

class DomFilter {
  String domFilterPage(String html, String page_name) {
    html = html.replaceAllMapped(
        RegExp('/mediawiki/'), (match) => 'http://4training.net/mediawiki/');
    html = html.replaceAllMapped(
        RegExp('//www.youtube.com'), (match) => 'http://www.youtube.com');

    DIVElement div =
        $divHTML(html) ?? $div(content: "Error: No html Code provided!");

    div.insertAt(
        0, $tag('h1', content: page_name.toString().replaceAll('_', ' ')));

    div.selectAllWhere('.noprint').forEach((element) {
      element.remove();
    });
    div.selectAllWhere('.mw-editsection').forEach((element) {
      element.remove();
    });

    debugPrint("filter passed");

    debugPrint(div.buildHTML(withIndent: true));
    return div.buildHTML(withIndent: false);
  }
}
