import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    TextEditingController dateinput = TextEditingController();
    dateinput.text = "";

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Добрый день!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
              ),
              SizedBox(height: 40),
              Container(
                height: 40,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ФИО',
                  ),
                  onChanged: (text) {

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
                      icon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                      labelText: 'Дата рождения',
                    ),
                  ),
                ),
                onTap: () async {
                  final pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2022));
                  if (pickedDate != null){
                    print(pickedDate);
                    // String formattedDate = DateFormat('yyy-MM-dd').format(pickedDate);
                    // print(formattedDate);
                    // dateinput.text = formattedDate;
                  }
                },
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                  ),
                  onChanged: (text) {

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

                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("авторизаться через", style: TextStyle(fontSize: 16)),
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
              Text("нет аккаунта?", style: TextStyle(fontSize: 16)),
              GestureDetector(
                child: Text("зарегистируйтесь",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
