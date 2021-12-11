import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/top_level_providers.dart';
import 'package:tomks_fintech_hack/constants/pages_ids.dart';

import 'auth_provider.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);
    final userAuthenticated = watch(userCompleteAuthenticationProvider);
    final phoneNumber = watch(phoneNumberProvider);
    final password = watch(passwordProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
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
              SizedBox(height: 40),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    minimumSize: Size.fromHeight(60)),
                child: Text("авторизация"),
                onPressed: () {
                  if (phoneNumber.state == "+7-777-777-7777" && password.state == "1234") {
                    userAuthenticated.state = true;
                  }
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("авторизация через", style: TextStyle(fontSize: 16)),
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
              Center(child: Text("нет аккаунта?", style: TextStyle(fontSize: 16))),
              Center(
                child: GestureDetector(
                  child: Text("зарегистируйтесь",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                  onTap: () {
                    bottomNavIndex.state = SIGN_UP_PAGE;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
