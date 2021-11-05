import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:for_training/res/custom_colors.dart';
import 'package:http/http.dart' as http;

import 'fetch_page.dart';

class GetPage {
  FutureBuilder getPage(String page_name) {
    return FutureBuilder(
        future: FetchPage().fetchPage(http.Client(), page_name),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Html(
                data: snapshot.data,
                style: {
                  "h1": Style.fromTextStyle(
                      Theme.of(context).textTheme.headline1!),
                  "h2": Style(
                      fontSize: const FontSize(25),
                      fontWeight: FontWeight.w500,
                      padding: const EdgeInsets.only(top: 30),
                      alignment: Alignment.bottomLeft,
                      border: const Border(
                          bottom: BorderSide(color: Colors.black38))),
                  "h3": Style.fromTextStyle(
                      Theme.of(context).textTheme.headline3!),
                  "td": Style(
                      border: Border.all(color: Colors.black, width: 0.5)),
                  "th": Style(
                      border: Border.all(color: Colors.black, width: 0.5)),
                  "table": Style(
                      border: Border.all(color: Colors.black, width: 0.5)),
                  "dt": Style(
                    fontWeight: FontWeight.w500,
                  ),
                  "a": Style(color: CustomColors.darkRed)
                },
              ),
            );
          }
          if (snapshot.hasError) {
            return Text("Error: " + snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
