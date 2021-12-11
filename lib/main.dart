import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/authorization/auth_page.dart';
import 'package:tomks_fintech_hack/app/faq/faq_page.dart';
import 'package:tomks_fintech_hack/app/feed/feed_page.dart';
import 'package:tomks_fintech_hack/app/introduction/introduction_page.dart';
import 'package:tomks_fintech_hack/app/market/market_page.dart';
import 'package:tomks_fintech_hack/app/my_company/my_company_page.dart';
import 'package:tomks_fintech_hack/app/portfolio/portfolio_page.dart';
import 'package:tomks_fintech_hack/app/sign_up/sign_up_page.dart';
import 'package:tomks_fintech_hack/constants/pages_ids.dart';
import 'package:tomks_fintech_hack/widgets/bottom_navigation_bar.dart';
import 'package:tomks_fintech_hack/widgets/floating_action_button.dart';

import 'app/top_level_providers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyNavigation(),
    );
  }
}

class MyNavigation extends ConsumerWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
  final bottomNavIndex = watch(bottomNavIndexProvider);

  Widget? _getBody() {
    switch (bottomNavIndex.state) {
      case MY_COMPANY_PAGE:
        {
          return MyCompanyPage();
        }
      case MARKET_PAGE:
        {
          return MarketPage();
        }
      case FEED_PAGE:
        {
          return FeedPage();
        }
      case FAQ_PAGE:
        {
          return FAQPage();
        }
      case PORTFOLIO_PAGE:
        {
          return PortfolioPage();
        }
      // case SIGN_UP_PAGE:
      //   {
      //     return SignUpPage();
      //   }
      // case AUTH_PAGE:
      //   {
      //     return AuthPage();
      //   }
    }
  }

  if (bottomNavIndex.state == INTRODUCTION_PAGE){
    return IntroductionPage();
  }
  if (bottomNavIndex.state == AUTH_PAGE){
    return AuthPage();
  }
  if (bottomNavIndex.state == SIGN_UP_PAGE){
    return SignUpPage();
  }

  return Scaffold(
        // appBar: AppBar(
        //   title: Text('${appBarName.state}'),
        //   actions: _getAppBarActions(),
        // ),
        body: _getBody(),
        floatingActionButton: MyFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyNavigationBar(),
      );
  }
}
