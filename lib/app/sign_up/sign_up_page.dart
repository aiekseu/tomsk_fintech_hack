import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tomks_fintech_hack/app/sign_up/sign_up_provider.dart';
import 'package:tomks_fintech_hack/constants/pages_ids.dart';

import '../top_level_providers.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);
    final fullName = watch(fullNameProvider);
    final birthday = watch(birthdayProvider);
    final phoneNumber = watch(phoneNumberProvider);
    final password = watch(passwordProvider);
    final repeatPassword = watch(repeatPasswordProvider);

    TextEditingController dateinput = TextEditingController();
    dateinput.text = "";

    _buildShadowBox() {
      return BoxDecoration(
        // borderRadius: BorderRadius.circular(30), //border corner radius
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(13, 71, 161, 0.15), //color of shadow
            blurRadius: 15, // blur radius
            offset: Offset(-2, 2), // changes position of shadow
          ),
        ],
      );
    }

    _buildInputDecoration(hintText) {
      return InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(8),
        hintText: hintText,
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffF7FBFF),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(40.0),
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Center(
              child: Text(
                "Добрый день!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
              ),
            ),
            SizedBox(height: 40),
            Container(
              decoration: _buildShadowBox(),
              child: TextField(
                obscureText: false,
                decoration: _buildInputDecoration('ФИО'),
                onChanged: (text) {
                  fullName.state = text;
                },
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              child: Container(
                decoration: _buildShadowBox(),
                child: TextField(
                  controller: dateinput,
                  decoration: _buildInputDecoration('Дата рождения'),
                  onChanged: (text) {
                    birthday.state = text;
                  },
                  onTap: () async {
                    final pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2022));
                    if (pickedDate != null){
                      print(pickedDate);
                      String formattedDate = DateFormat('yyy-MM-dd').format(pickedDate);
                      print(formattedDate);
                      // birthday.state = formattedDate;
                      dateinput.text = formattedDate;
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: _buildShadowBox(),
              child: TextField(
                obscureText: false,
                decoration: _buildInputDecoration('Телефон'),
                keyboardType: TextInputType.number,
                inputFormatters: [MaskedInputFormatter('+#-###-###-####')],
                onChanged: (text) {
                  phoneNumber.state = text;
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: _buildShadowBox(),
              child: TextField(
                obscureText: true,
                decoration: _buildInputDecoration('Пароль'),
                onChanged: (text) {
                  password.state = text;
                },
              ),
            ),

            SizedBox(height: 20),
            Container(
              decoration: _buildShadowBox(),
              child: TextField(
                obscureText: true,
                decoration: _buildInputDecoration('Повторите пароль'),
                onChanged: (text) {
                  repeatPassword.state = text;
                },
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  minimumSize: Size.fromHeight(60)),
              child: Text("Создать аккаунт"),
              onPressed: () {

              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("регистрация через", style: TextStyle(fontSize: 16)),
                SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "images/vk_logo.png",
                        width: 32,
                        height: 32,
                      ),
                      Image.asset(
                        "images/telegram_logo.png",
                        width: 32,
                        height: 32,
                      ),
                      Image.asset(
                        "images/tpu_logo.png",
                        width: 32,
                        height: 32,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            Center(child: Text("есть аккаунт?", style: TextStyle(fontSize: 16))),
            Center(
              child: GestureDetector(
                child: Text("войдите",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
                onTap: () {
                  bottomNavIndex.state = AUTH_PAGE;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
