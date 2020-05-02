import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stimmungsringeapp/data/freezed_classes.dart';
import 'package:stimmungsringeapp/data/sentiment.dart';
import 'package:stimmungsringeapp/pages/dashboard/bloc/bloc.dart';
import 'package:stimmungsringeapp/repositories/dashboard_repository.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository dashboardRepository;
  StreamSubscription<void> _refreshSubscription;

  DashboardBloc({this.dashboardRepository}) {
    _refreshSubscription =
        Stream<void>.periodic(const Duration(seconds: 3)).listen((_) {
      add(RefreshDashboard());
    });
  }

  @override
  DashboardState get initialState => DashboardUninitialized();

  @override
  void onTransition(Transition<DashboardEvent, DashboardState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is FetchDashboard) {
      yield* _mapFetchDashboardToState(event);
    } else if (event is RefreshDashboard) {
      yield* _mapRefreshDashboardToState(event);
    } else if (event is SetNewSentiment) {
      yield* _mapSetNewSentimentToState(event);
    }
  }

  Stream<DashboardState> _mapFetchDashboardToState(
      FetchDashboard fetch) async* {
    if (state is DashboardLoading) {
      return;
    }
    yield DashboardLoading();
    try {
      final dashboard = await dashboardRepository.loadDashboardPageData();
      final String dashboardHash = dashboardRepository.getHash(dashboard);
      yield DashboardLoaded(dashboard);

      prevDashboardHash = dashboardHash;

      return;
    } catch (ex) {
      print(ex);
      if (state is DashboardLoaded) {
        yield DashboardError((state as DashboardLoaded).dashboard);
      } else {
        yield DashboardError(null);
      }
    }
  }

  String prevDashboardHash;

  Stream<DashboardState> _mapRefreshDashboardToState(
      RefreshDashboard refresh) async* {
    try {
      final Dashboard dashboard =
          await dashboardRepository.loadDashboardPageData();
      final String dashboardHash = dashboardRepository.getHash(dashboard);

      if (dashboardHash == this.prevDashboardHash) {
        print("Dashboard did not change");
      } else {
        // TODO animation
        yield DashboardLoaded(dashboard);
        print("Dashboard refreshed");
      }
    } catch (ex) {
      print(ex);
    }
  }

  Stream<DashboardState> _mapSetNewSentimentToState(
      SetNewSentiment setNewSentiment) async* {
    try {
      if (state is DashboardLoaded) {
        final Dashboard prevDashboard = (state as DashboardLoaded).dashboard;
        final Dashboard optimisticUpdate = prevDashboard.copyWith(
            myTile: prevDashboard.myTile
                .copyWith(sentiment: setNewSentiment.sentiment));
        print(
            "optimistic set ${optimisticUpdate.myTile.sentiment.sentimentCode}");
        yield DashboardLoaded(optimisticUpdate);
      }

      await dashboardRepository.setNewSentiment(setNewSentiment.sentiment);
      final Dashboard loadDashboardPageData =
          await dashboardRepository.loadDashboardPageData();
      print(
          "reloaded dashboard ${loadDashboardPageData.myTile.sentiment.sentimentCode}");
      yield DashboardLoaded(loadDashboardPageData);
    } catch (_) {
      yield DashboardError((state as DashboardLoaded).dashboard);
    }
  }

  @override
  Future<void> close() {
    if (_refreshSubscription != null) {
      _refreshSubscription.cancel();
      _refreshSubscription = null;
    }
    return super.close();
  }
}
