import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarketPage extends ConsumerWidget {
  const MarketPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    return SafeArea(
      child: Center(
        child: Text('market '),
      ),
    );
  }
}
