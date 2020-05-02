import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stimmungsringeapp/config.dart';
import 'package:stimmungsringeapp/data/freezed_classes.dart';
import 'package:stimmungsringeapp/data/sentiment.dart';
import 'package:stimmungsringeapp/repositories/chaos_monkey.dart';
import 'package:stimmungsringeapp/session.dart';

class DashboardRepository {
  Future<Dashboard> loadDashboardPageData() async {
    final String url = '${Config().backendUrl}/dashboard';

    final http.Response response = await http.get(
      url,
      headers: {'X-User-ID': currentUserId},
    );

    assert(
        response.statusCode == 200, "load dashboard -> ${response.statusCode}");

    final Dashboard dashboard =
        Dashboard.fromJson(json.decode(response.body) as Map<String, dynamic>);

    await ChaosMonkey.delayAsync();
    return dashboard;
  }

  Future<void> setNewSentiment(Sentiment sentiment) async {
    final String url = '${Config().backendUrl}/mystatus';

    final http.Response response = await http.put(url,
        headers: {
          'X-User-ID': currentUserId,
          "Content-Type": "application/json"
        },
        body: json.encode(SentimentUpdate(sentiment.sentimentCode)));
    // TODO response handling

    assert(response.statusCode == 200);

    await ChaosMonkey.delayAsync();
  }

  Future<OtherDetail> loadOtherDetailPageData(String userId) async {
    final String url = '${Config().backendUrl}/otherstatuspage/$userId';

    final http.Response response = await http.get(
      url,
      headers: {'X-User-ID': currentUserId},
    );

    assert(response.statusCode == 200);

    //await new Future.delayed(const Duration(seconds: 1));

    final OtherDetail detailPage = OtherDetail.fromJson(
        json.decode(response.body) as Map<String, dynamic>);

    await ChaosMonkey.delayAsync();
    return detailPage;
  }
}
