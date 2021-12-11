import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/my_company/my_company_provider.dart';
import 'package:tomks_fintech_hack/app/my_company/widgets/input_with_label.dart';
import 'package:tomks_fintech_hack/data/company.dart';

class AddCompanyPage extends ConsumerWidget {
  const AddCompanyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final name = TextEditingController();
    final INN = TextEditingController();
    final OGRN = TextEditingController();
    final occupation = TextEditingController();
    final address = TextEditingController();
    final regDate = TextEditingController();
    final site = TextEditingController();
    final desc = TextEditingController();
    final rating = TextEditingController();

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
                  'Создать компанию',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      name.text = 'Криптозайм';
                      INN.text = '1234567890';
                      OGRN.text = '1234567890';
                      occupation.text = 'Инвестиции';
                      address.text =
                          '634034, г. Томск, ул. Красноармейская 157, БИ "Дружба"';
                      regDate.text = DateTime.now().toString();
                      site.text = '2ch.hk';
                      desc.text = 'Не скам';
                      rating.text = 'AAA';
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            InputWithLabel(
              label: 'Название',
              stateProvider: companyNameProvider,
              controller: name,
            ),
            InputWithLabel(
              label: 'ИНН',
              stateProvider: companyINNProvider,
              controller: INN,
            ),
            InputWithLabel(
              label: 'ОГРН',
              stateProvider: companyOGRNProvider,
              controller: OGRN,
            ),
            InputWithLabel(
              label: 'Деятельность',
              stateProvider: companyOccupationProvider,
              controller: occupation,
            ),
            InputWithLabel(
              label: 'Юр. адрес',
              stateProvider: companyAddressProvider,
              controller: address,
            ),
            InputWithLabel(
              label: 'Дата регистрации компании',
              stateProvider: companyRegDateProvider,
              controller: regDate,
            ),
            InputWithLabel(
              label: 'Сайт компании',
              stateProvider: companySiteProvider,
              controller: site,
            ),
            InputWithLabel(
              label: 'Описание компании',
              stateProvider: companyDescProvider,
              controller: desc,
            ),
            InputWithLabel(
              label: 'Рейтинг',
              stateProvider: companyRatingProvider,
              controller: rating,
            ),
            SizedBox(height: 22,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                minimumSize: Size.fromHeight(60),
              ),
              child: Text("Создать компанию"),
              onPressed: () async {
                Navigator.pop(
                  context,
                  new Company(
                      inn: INN.text,
                      ogrn: OGRN.text,
                      name: name.text,
                      rating: rating.text,
                      occupation: occupation.text,
                      description: desc.text,
                      address: address.text,
                      registrationDate: DateTime.parse(regDate.text),
                      website: site.text),
                );
              },
            ),
            SizedBox(height: 22,),
          ],
        ),
      ),
    );
  }
}
