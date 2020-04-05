import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stimmungsringeapp/data/dashboard.dart';
import 'package:stimmungsringeapp/data/freezed_classes.dart';
import 'package:stimmungsringeapp/data/sentiment.dart';
import 'package:stimmungsringeapp/pages/dashboard/bloc/bloc.dart';
import 'package:stimmungsringeapp/pages/other_detail_page.dart';
import 'package:stimmungsringeapp/pages/overview_page.dart';
import 'package:stimmungsringeapp/pages/set_my_sentiment_page.dart';

void main() {
  // TODO: throws exceptions on start
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(SentimentApp());
}

class SentimentApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SentimentAppState();
  }
}

class _SentimentAppState extends State<SentimentApp> {
  Dashboard _dashboard;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Stimmungsringe',
      routes: {
        '/': (_) => BlocProvider<DashboardBloc>(
              create: (context) => DashboardBloc()..add(FetchDashboard()),
              child: new OverviewPage(),
            ),
        'my-sentiment': (_) => SetMySentimentPage(
              dashboard: _dashboard,
              onSentimentChange: _updateMySentiment,
            ),
        'other-detail-page': (context) => OtherDetailPage(
            dashboard: _dashboard,
            otherUserId: ModalRoute.of(context).settings.arguments)
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loadDashboardPageData().then((dashboard) {
      setState(() => _dashboard = dashboard);
    });
  }

  _updateMySentiment(final SentimentUi sentimentUi) {
    final SentimentStatus sentimentStatus =
        SentimentStatus(Sentiment(sentimentUi.name)); // TODO extract
    if (_dashboard.myTile.sentimentStatus != sentimentStatus) {
      setState(() => _dashboard = _dashboard.copyWith(
          myTile:
              _dashboard.myTile.copyWith(sentimentStatus: sentimentStatus)));
    }
  }
}
