import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'dom_filter.dart';

class JSONParser {
  String parsePage(String responseBody, String page_name) {
    final Map<String, dynamic> parsed = jsonDecode(responseBody);

    debugPrint("mapping passed");

    if (parsed["parse"]["text"]["*"] == null) {
      return "Error retrieving page";
    }

    var data = parsed["parse"]["text"]["*"];
    debugPrint("parsing passed");

    return DomFilter().domFilterPage(data.toString(), page_name);
  }
}
