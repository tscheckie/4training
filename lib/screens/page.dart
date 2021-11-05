import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:for_training/utils/get_page.dart';
import 'package:for_training/widgets/main_drawer.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key, required String page})
      : pageName = page,
        super(key: key);

  static const String routeName = "/prayer";
  final pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4training'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: GetPage().getPage(pageName),
    );
  }
}
