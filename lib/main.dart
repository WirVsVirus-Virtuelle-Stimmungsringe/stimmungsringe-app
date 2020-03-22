import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stimmungsringeapp/datamappings.dart';
import 'package:stimmungsringeapp/pages/overview.dart';
import 'package:stimmungsringeapp/pages/set_own_mood.dart';

void main() {
  // TODO: throws exceptions on start
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(StimmungslagenApp());
}


class StimmungslagenApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StimmungslageState();
  }

}


class _StimmungslageState extends State<StimmungslagenApp> {

  Dashboard _dashboard;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Stimmungsringe',
      routes: {
        '/': (_) => OverviewPage(dashboard: _dashboard),
        'own-mood': (_) => SetOwnMoodPage(),
      },
    );
  }

  @override
  void initState() {

    loadDashboardPageData().then((dashboard) {

      this.setState(() =>
        _dashboard = dashboard
      );

    });
  }

}


