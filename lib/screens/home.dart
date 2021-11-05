import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_training/utils/get_page.dart';
import 'package:for_training/widgets/main_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pageName = "Start";
  bool _upDatePage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("4training"),
      ),
      drawer: const MainDrawer(),
      body: GetPage().getPage(pageName, context, _upDatePage),
    );
  }
}
