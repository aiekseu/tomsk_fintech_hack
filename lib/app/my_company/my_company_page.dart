import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tomks_fintech_hack/app/my_company/add_request_page.dart';
import 'package:tomks_fintech_hack/app/my_company/my_company_provider.dart';
import 'package:tomks_fintech_hack/app/my_company/add_company_page.dart';
import 'package:tomks_fintech_hack/app/my_company/widgets/request_card.dart';

class MyCompanyPage extends ConsumerWidget {
  const MyCompanyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    final company = watch(companyProvider);
    final isVerified = watch(companyIsVerifiedProvider);
    final requestsList = watch(requestsProvider);

    if (company.state == null) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12, top: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'У вас еще нет компании',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'После создания компании вам нужно будет пройти этап верификации: интервью с андеррайтером и отправить 1 рубль в качестве акцепта. Вся процедура верификации, как правило, занимает не более 1,5 часов',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    minimumSize: Size.fromHeight(60)),
                child: Text("Создать компанию"),
                onPressed: () async {
                  company.state = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCompanyPage()),
                  );
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget _isVerified() {
      if (isVerified.state)
        return Text('Верифицированная компания');
      else
        return Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                minimumSize: Size.fromHeight(60),
                primary: Color(0xff1E88E5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text("Верифицировать компанию"),
              onPressed: () {
                isVerified.state = true;
                // requestsList.state.add(await Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AddRequestPage()),
                // ));
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Следующий этап верификации: интервью с андеррайтером и отправка 1 рубля в качестве акцепта. Вся процедура, как правило, занимает не более 1,5 часов.',
            )
          ],
        );
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
                  '${company.state?.name}',
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
            _isVerified(),
            SizedBox(
              height: 22,
            ),
            Text(
              'Информация',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '${company.state?.description}',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Показатели',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Все хорошо',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Ваши запросы',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  minimumSize: Size(180, 60),
                  primary: Color(0xff1E88E5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text("Создать сбор средств"),
                onPressed: isVerified.state
                    ? () async {
                        var tempRequest = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddRequestPage(),
                          ),
                        );
                        requestsList.state.add(tempRequest);
                      }
                    : null),
            Expanded(
              child: ListView.builder(
                itemCount: requestsList.state.length,
                padding: EdgeInsets.only(top: 12),
                itemBuilder: (context, index) {
                  return RequestCard(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
