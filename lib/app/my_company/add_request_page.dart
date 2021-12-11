import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/my_company/my_company_provider.dart';
import 'package:tomks_fintech_hack/app/my_company/widgets/input_with_label.dart';
import 'package:tomks_fintech_hack/data/request.dart';

class AddRequestPage extends ConsumerWidget {
  const AddRequestPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final goal = TextEditingController();
    final minPayment = TextEditingController();
    final rate = TextEditingController();
    final softCap = TextEditingController();
    final hardCap = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 12.0, right: 12, top: 8),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Создать сбор средств',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      goal.text = 'На миллион транзакций в блокчейне';
                      minPayment.text = '5000';
                      rate.text = '10';
                      softCap.text = '500000';
                      hardCap.text = "1000000";
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            InputWithLabel(
              label: 'Цель',
              stateProvider: requestGoalProvider,
              controller: goal,
            ),
            InputWithLabel(
              label: 'Минимальный взнос',
              stateProvider: requestMinPaymentProvider,
              controller: minPayment,
            ),
            InputWithLabel(
              label: 'Ставка, %',
              stateProvider: requestRateProvider,
              controller: rate,
            ),
            InputWithLabel(
              label: 'Минимальная сумма сбора',
              stateProvider: requestSoftCapProvider,
              controller: softCap,
            ),
            InputWithLabel(
              label: 'Максимальная сумма сбора',
              stateProvider: requestHardCapProvider,
              controller: hardCap,
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                minimumSize: Size.fromHeight(60),
              ),
              child: Text("Начать сбор средств"),
              onPressed: () async {
                Navigator.pop(
                    context,
                    new Request(
                        minPayment: double.parse(softCap.text),
                        rate: double.parse(rate.text),
                        goal: goal.text,
                        softCap: int.parse(softCap.text),
                        hardCap: int.parse(hardCap.text)));
              },
            ),
            SizedBox(height: 120,),
            Image.asset('images/jewish.jpeg'),
          ],
        ),
      ),
    );
  }
}
