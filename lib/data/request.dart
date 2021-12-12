import 'dart:math';

import 'package:tomks_fintech_hack/data/request_cash_flow.dart';

class Request {
  int id;
  String companyName;
  double minPayment;
  String rating;
  double rate;
  String goal;
  int softCap;
  int hardCap;
  int accumulatedSum;
  DateTime softEndDate;
  DateTime hardEndDate;
  String photo;

  Request(
      {this.id = 0,
      this.companyName = '',
      required this.minPayment,
      this.rating = '',
      required this.rate,
      required this.goal,
      required this.softCap,
      required this.hardCap,
      this.accumulatedSum = 0,
      required this.softEndDate,
      required this.hardEndDate,
      this.photo = "mem_photo.png"
      });

  static Request fromJson(
      Map<String, dynamic> json, List<RequestCashFlow> requestCashFlowList) {
    var request_id = json['id'];
    var filteredCashFlows = requestCashFlowList
        .where((element) => element.requestId == request_id)
        .toList();
    var accumulatedSum = 0;
    filteredCashFlows.forEach((element) {
      accumulatedSum += element.sum;
    });

    var company_id = json['company'].cast<Map, dynamic>()['id'];
    var company_photo = null;
    switch (company_id){
      case 1:
        company_photo = "ambit_photo.png";
        break;
      case 2:
        company_photo = "zennex_photo.png";
        break;
      case 3:
        company_photo = "garrant_photo.jpg";
        break;
      default:
        company_photo = "candle_photo.png";
    }

    return Request(
      companyName: json['company'].cast<Map, dynamic>()['name'],
      minPayment: json['min_payment'],
      rating: json['company'].cast<Map, dynamic>()['rating'],
      rate: json['rate'],
      goal: json['goal'],
      softCap: json['soft_cap'].round(),
      hardCap: json['hard_cap'].round(),
      accumulatedSum: accumulatedSum,
      softEndDate: DateTime.now(),
      hardEndDate: DateTime.now(),
      photo: company_photo,
    );
  }
}
