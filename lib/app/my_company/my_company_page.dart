import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCompanyPage extends ConsumerWidget {
  const MyCompanyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    return SafeArea(
      child: Center(
        child: Text('my_company'),
      ),
    );
  }
}
