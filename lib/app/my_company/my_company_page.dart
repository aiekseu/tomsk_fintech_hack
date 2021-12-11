import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/my_company/my_company_provider.dart';

class MyCompanyPage extends ConsumerWidget {
  const MyCompanyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    final company = watch(companyProvider);

    if (company.state == null) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12, top: 32),
          child: Column(
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

            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Center(
        child: Text('my_company'),
      ),
    );
  }
}
