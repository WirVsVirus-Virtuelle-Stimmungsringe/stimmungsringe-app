import 'package:familiarise/data/dashboard.dart';
import 'package:familiarise/data/my_tile.dart';
import 'package:familiarise/data/sentiment.dart';
import 'package:familiarise/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:familiarise/pages/dashboard/bloc/dashboard_event.dart';
import 'package:familiarise/pages/dashboard/bloc/dashboard_state.dart';
import 'package:familiarise/repositories/avatar_repository.dart';
import 'package:familiarise/widgets/avatar_row.dart';
import 'package:familiarise/widgets/loading_spinner.dart';
import 'package:familiarise/widgets/sentiment_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetMySentimentPage extends StatelessWidget {
  static const String routeUri = '/my-sentiment';

  static MapEntry<String, WidgetBuilder> route = MapEntry(
    routeUri,
    (context) => BlocProvider<DashboardBloc>.value(
      value: ModalRoute.of(context).settings.arguments as DashboardBloc,
      child: SetMySentimentPage(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      if (state.hasDashboard) {
        return _buildLoadedPage(context, state as StateWithDashboard);
      } else {
        return LoadingSpinner();
      }
    });
  }

  Widget _buildLoadedPage(BuildContext context, StateWithDashboard state) {
    final Dashboard dashboard = state.dashboard;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Persönliches Wetter'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AvatarRow(
              name: dashboard.myTile.user.hasName
                  ? dashboard.myTile.user.displayName
                  : '',
              image:
                  AvatarRepository().avatarImage(dashboard.myTile.user.userId),
              avatarSentiment: dashboard.myTile.sentiment,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Title(
                color: CupertinoColors.black,
                child: const Text(
                  'Wie würdest Du Dein persönliches Wetter gerade beschreiben?',
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: _allSentiments(context, dashboard.myTile),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _allSentiments(BuildContext context, MyTile myTile) {
    return Sentiment.values.map((sentiment) {
      return Center(
        child: SentimentIconButton(
          sentiment: sentiment,
          isSelected: myTile.sentiment == sentiment,
          onTap: (sentiment) {
            final DashboardBloc dashboardBloc =
                BlocProvider.of<DashboardBloc>(context);
            dashboardBloc.add(SetNewSentiment(sentiment));
          },
        ),
      );
    }).toList(growable: false);
  }
}
