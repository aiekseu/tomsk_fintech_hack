import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'portfolio_provider.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {

    return SafeArea(
      child: Center(
        child: Text('portfolio')
      ),
    );
  }
}