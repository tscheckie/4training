import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:for_training/screens/page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.zero,
              child: GestureDetector(
                  onTap: () => {},
                  child: Image.asset(
                    'assets/4training.png',
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),
          expansionTileBasics(context),
          expansionTileMore(context),
          expansionTileLanguages(context),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.faq,
              style: CustomTextStyles.firstLvlListTile,
            ),
            trailing: const Icon(Icons.help_outline),
            onTap: () => Navigator.pushNamed(context, ContentPage.routeName,
                arguments: {'page': 'FAQ'}),
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.contact,
              style: CustomTextStyles.firstLvlListTile,
            ),
            trailing: const Icon(Icons.mail_outline),
            onTap: () => Navigator.pushNamed(context, ContentPage.routeName,
                arguments: {'page': 'FAQ'}),
          ),
        ],
      ),
    );
  }

  Widget expansionTileBasics(BuildContext c) => ExpansionTile(
        title: Text(
          AppLocalizations.of(c)!.basics,
          style: CustomTextStyles.firstLvlListTile,
        ),
        //leading: Icon(Icons.home_outlined),
        children: [
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.godsStory, c, "God's_Story"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.baptism, c, "Baptism"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.forgivingStepByStep, c,
              "Forgiving_Step_by_Step"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.prayer, c, "Prayer"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.confessingSinsAndRepenting,
              c,
              "Confessing_Sins_and_Repenting"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.timeWithGod, c, "Time_with_God"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.hearingFromGod, c, "Hearing_from_God"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.church, c, "Church"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.healing, c, "Healing"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.myStoryWithGod, c, "My_Story_with_God"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.bibleReadingHints, c,
              "Bible_Reading_Hints"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.theThreeThirdsProcess, c,
              "The_Three-Thirds_Process"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.trainingMeetingOutline, c,
              "Training_Meeting_Outline"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.aDailyPrayer, c, "A_Daily_Prayer"),
        ],
      );

  Widget expansionTileMore(BuildContext c) => ExpansionTile(
        title: Text(
          AppLocalizations.of(c)!.more,
          style: CustomTextStyles.firstLvlListTile,
        ),
        //leading: Icon(Icons.more_horiz),
        children: [
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.overcomingFearAndAnger, c,
              "Overcoming_Fear_and_Anger"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.gettingRidOfColoredLenses,
              c, "Getting_Rid_of_Colored_Lenses"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.familyAndOurRelationWithGod,
              c,
              "Family_and_our_Relationship_with_God"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.overcomingNegativeInheritance,
              c,
              "Overcoming_Negative_Inheritance"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.forgivingStepByStepTrainingOutline,
              c,
              "Forgiving_Step_by_Step:_Training_Notes"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.leadingOthersThroughForgiveness,
              c,
              "Leading_Others_Through_Forgiveness"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.theRoleOfAHelperInPrayer,
              c, "The_Role_of_a_Helper_in_Prayer"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.leadingAPrayerTime, c,
              "Leading_a_Prayer_Time"),
          _2ndLevelDrawerItem(
              AppLocalizations.of(c)!.howToContinueAfterAPrayerTime,
              c,
              "How_to_Continue_After_a_Prayer_Time"),
          _2ndLevelDrawerItem(AppLocalizations.of(c)!.fourKindsOfDisciples, c,
              "Four_Kinds_of_Disciples"),
        ],
      );

  Widget expansionTileLanguages(BuildContext c) => ExpansionTile(
        title: Text(
          AppLocalizations.of(c)!.languages,
          style: CustomTextStyles.firstLvlListTile,
        ),
        //leading: Icon(Icons.language),
        children: [
          _2ndLevelDrawerItem('...', c, ""),
          _2ndLevelDrawerItem('...', c, ""),
          _2ndLevelDrawerItem('...', c, ""),
          _2ndLevelDrawerItem('...', c, ""),
        ],
      );

  Widget _2ndLevelDrawerItem(String text, BuildContext c, String name) {
    return ListTile(
      title: Text(text, style: CustomTextStyles.secondLvlListTile),
      onTap: () => Navigator.of(c)
          .pushNamed(ContentPage.routeName, arguments: {'page': name}),
    );
  }
}

class CustomTextStyles {
  static TextStyle secondLvlListTile =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w300);

  static TextStyle firstLvlListTile =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
