import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../top_level_providers.dart';
import 'portfolio_provider.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {

    final userVerified = watch(userVerifiedProvider);

    Widget _isVerifyed() {
      if (userVerified.state) {
        return Text('Верифицированный пользователь');
      } else {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Card(
            color: Colors.blueAccent[100],
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.security,
                    size: 65,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Пройти верификацию',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }


    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Paolo Mattew',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' ID1100',
                  style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.settings,
                  size: 26,
                )
              ],
            ),
            _isVerifyed(),
          ],
        ),
      ),
    );
  }
}
