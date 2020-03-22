import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stimmungsringeapp/pages/overview.dart';
import 'package:stimmungsringeapp/pages/set_own_mood.dart';

void main() {
  // TODO: throws exceptions on start
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(StimmungslagenApp());
}

class StimmungslagenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Stimmungsringe',
      routes: {
        '/': (_) => OverviewPage(),
        'own-mood': (_) => SetOwnMoodPage(),
      },
    );
  }
}
