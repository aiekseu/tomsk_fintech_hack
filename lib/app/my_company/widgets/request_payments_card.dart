import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../my_company_provider.dart';

class RequestPaymentCard extends ConsumerWidget {
  final index;

  const RequestPaymentCard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final requestsList = watch(requestsProvider);

    return SizedBox(
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        color: Color(0xfffae2f0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: ListView(
                children: [
                  Text(
                    'Долг',
                    style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  Text(
                    '\$ ${requestsList.state[index]?.softCap ?? '-'}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Погасить',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Color(0xff0D47A1)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: ListView(
                children: [
                  Text(
                    'Дата следующего платежа',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '${DateFormat('dd-MM-yyyy').format(requestsList.state[index]!.softEndDate)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: ListView(
                children: [
                  Text(''),
                  Text(
                    'Отчет недоступен',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: ListView(
                children: [
                  Text(
                    'Сумма следующего платежа',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '\$ ${requestsList.state[index]!.softCap * 0.34}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
