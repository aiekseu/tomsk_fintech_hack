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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            child: ListView(
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
                  height: 40,
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: Color(0xffE3F2FD),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'ФИО',
                    ),
                    onChanged: (text) {
                      fullName.state = text;
                    },
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Container(
                    height: 40,
                    child: TextField(
                      controller: dateinput,
                      decoration: InputDecoration(
                        fillColor: Color(0xffE3F2FD),
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Дата рождения',
                      ),
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
                  height: 40,
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: Color(0xffE3F2FD),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Телефон',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      MaskedInputFormatter('+#-###-###-####')
                    ],
                    onChanged: (text) {
                      phoneNumber.state = text;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xffE3F2FD),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Пароль',
                    ),
                    onChanged: (text) {
                      password.state = text;
                    },
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  height: 40,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Color(0xffE3F2FD),
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Повторите пароль',
                    ),
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
        ),
      ),
    );
  }
}
