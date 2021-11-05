import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:for_training/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'json_parsing.dart';

class FetchPage {
  Future<String> fetchPage(http.Client client, String page_name, BuildContext c,
      bool updateFile) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = dir.path;

    var file = File("$path/$page_name.txt");
    String page;

    bool isConnected = await checkInternetConnection();

    debugPrint("Update: $updateFile");

    if (updateFile && isConnected) {
      // Get the page from the internet
      Uri url = Uri.parse(
          'http://4training.net/mediawiki/api.php?page=$page_name&action=parse&format=json');
      final response = await client.get(url);
      debugPrint("response passed");

      // Parse the retrieved page
      page = JSONParser().parsePage(response.body, page_name);

      // Save retrieved page
      await file.writeAsString(page);
      debugPrint("////// File $page_name.txt Created");
    } else if (await file.exists()) {
      // Try reading existing file
      page = await file.readAsString();
    } else {
      String s = AppLocalizations.of(c)!.noContent;

      // If no connection and no file, error 404
      page = "<p>$s</p>";
    }

    return page;
  }
}
