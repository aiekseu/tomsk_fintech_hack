import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/data/company.dart';
import 'package:tomks_fintech_hack/data/request.dart';
import 'package:http/http.dart' as http;
import 'package:tomks_fintech_hack/data/request_cash_flow.dart';

final CATEGORY_UP = 'category_up';
final CATEGORY_DOWN = 'category_down';
final RATING_UP = 'rating_up';
final RATING_DOWN = 'rating_down';
final RATE_UP = 'rate_up';
final RATE_DOWN = 'rate_down';

final categoryArrowUpProvider = StateProvider<bool>((ref) => true);
final reliabilityArrowUpProvider = StateProvider<bool>((ref) => false);
final rateArrowUpProvider = StateProvider<bool>((ref) => false);
final pressedButtonProvider = StateProvider<String>((ref) => CATEGORY_UP);

final searchCompanyProvider = StateProvider<String>((ref) => "");

final requestsCashFlowProvider = FutureProvider<List<RequestCashFlow>>((ref) async {
  final requestCashFlow = await http.get(Uri.parse('https://fintech-hack2.herokuapp.com/api/request_cash_flow/'));
  final _requestCashFlowList = <RequestCashFlow>[];
  if(requestCashFlow.statusCode == 200) {
    for (var i =0; i< jsonDecode(utf8.decode(requestCashFlow.bodyBytes)).length; i++){
      _requestCashFlowList.add(RequestCashFlow.fromJson(jsonDecode(utf8.decode(requestCashFlow.bodyBytes))[i]));
    }
  } else {
    throw Exception('Failed to load requests');
  }
  return _requestCashFlowList;
});

final requestsProvider = FutureProvider<List<Request>>((ref) async {
  // final fakeRequests = [
  //   Request(
  //       companyName:"ООО Амбит",
  //       minPayment: 1000,
  //       rating: "CCC",
  //       rate: 12.4,
  //       goal: 'на проект',
  //       softCap: 900000,
  //       hardCap: 1000000,
  //       accumulatedSum: 1000,
  //       softEndDate: DateTime(2021, 12),
  //       hardEndDate: DateTime(2022, 2)),
  //   Request(
  //       companyName: "ZENNEX",
  //       minPayment: 1000,
  //       rating: "AAA",
  //       rate: 13.7,
  //       goal: 'На сайт',
  //       softCap: 900000,
  //       hardCap: 1000000,
  //       accumulatedSum: 500000,
  //       softEndDate: DateTime(2021, 12),
  //       hardEndDate: DateTime(2022, 2)),
  //   Request(
  //       companyName: "АО ГАРАНТ",
  //       minPayment: 1000,
  //       rating: "BBB",
  //       rate: 23.7,
  //       goal: 'На сайт',
  //       softCap: 900000,
  //       hardCap: 1000000,
  //       accumulatedSum: 870000,
  //       softEndDate: DateTime(2021, 12),
  //       hardEndDate: DateTime(2022, 2)),
  //
  // ];
  // return Future.delayed(Duration(seconds: 2)).then((value) => fakeRequests);

  final requestCashFlow = await http.get(Uri.parse('https://fintech-hack2.herokuapp.com/api/request_cash_flow/'));
  final _requestCashFlowList = <RequestCashFlow>[];
  if(requestCashFlow.statusCode == 200) {
    for (var i =0; i< jsonDecode(utf8.decode(requestCashFlow.bodyBytes)).length; i++){
      _requestCashFlowList.add(RequestCashFlow.fromJson(jsonDecode(utf8.decode(requestCashFlow.bodyBytes))[i]));
    }
  } else {
    throw Exception('Failed to load requests');
  }

  final _requestList = <Request>[];
  final response = await http.get(Uri.parse('https://fintech-hack2.herokuapp.com/api/requests/'));

  if(response.statusCode == 200) {
    for (var i =0; i< jsonDecode(utf8.decode(response.bodyBytes)).length; i++){
      _requestList.add(Request.fromJson(jsonDecode(utf8.decode(response.bodyBytes))[i], _requestCashFlowList));
    }
  } else {
    throw Exception('Failed to load requests');
  }



  return _requestList;
});
