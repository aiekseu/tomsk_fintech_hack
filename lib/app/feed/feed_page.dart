import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedPage extends ConsumerWidget {
  const FeedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    return SafeArea(
      child: Center(
        child: Text('feed'),
      ),
    );
  }
}
