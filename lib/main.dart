import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      return Scaffold(
        // appBar: AppBar(
        //   title: Text('${appBarName.state}'),
        //   actions: _getAppBarActions(),
        // ),
        body: Center(
          child: Text('hello belig'),
        ),
        floatingActionButton: MyFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyNavigationBar(),
      );
  }
}
