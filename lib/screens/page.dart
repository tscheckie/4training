import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:for_training/utils/get_page.dart';
import 'package:for_training/utils/utils.dart';
import 'package:for_training/widgets/main_drawer.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key, required String page})
      : pageName = page,
        super(key: key);

  static const String routeName = "/prayer";
  final pageName;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  void initState() {
    super.initState();
  }

  bool _upDatePage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('4training'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _upDatePage = true;
                ScaffoldMessenger.of(context).showSnackBar(
                    upDateSnackbar(AppLocalizations.of(context)!.updating));
              });
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: GetPage().getPage(widget.pageName, context, _upDatePage),
    );
  }
}
