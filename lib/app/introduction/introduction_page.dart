import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    return SafeArea(
      child: Center(
        child: Text('intro'),
      ),
    );
  }
}
