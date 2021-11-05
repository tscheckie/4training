import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'json_parsing.dart';

class FetchPage {
  Future<String> fetchPage(http.Client client, String page_name) async {
    Uri url = Uri.parse(
        'http://4training.net/mediawiki/api.php?page=$page_name&action=parse&format=json');

    final response = await client.get(url);

    debugPrint("response passed");

    final dir = await getApplicationDocumentsDirectory();
    final path = dir.path;

    var file = File("$path/$page_name.txt");
    String page;

    // Check if file has content
    // if (!await file.exists()) {
    page = JSONParser().parsePage(response.body, page_name);
    await file.writeAsString(page);
    debugPrint("////// File $page_name.txt Created");
    //} else {
    // debugPrint("////// File $pageName.txt already Existed");
    //}

    page = await file.readAsString();
    //debugPrint(page);

    return page;
  }
}
