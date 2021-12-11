import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tomks_fintech_hack/app/top_level_providers.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({
    Key? key,
  }) : super(key: key);

  PageDecoration _buildPageDecoration() {
    const boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffB8A7FF),
            Color(0xff2196F3),
          ]),
    );

    final pageDecoration = PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400),
        bodyTextStyle: TextStyle(fontSize: 18.0),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        // pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
        boxDecoration: boxDecoration);

    return pageDecoration;
  }

  DotsDecorator _buildDotsDecorator() {
    return DotsDecorator(color: Colors.white, activeColor: Color(0xffB8A7FF));
  }

  Widget _buildImage(String assetName, [double height = 300]) {
    return Container(
        child: Image.asset('images/$assetName', height: height)
    );
  }

  @override
  Widget build(context, watch) {
    final userCompleteIntroduction = watch(userCompleteIntroductionProvider);

    void _onIntroEnd(context) {
      userCompleteIntroduction.state = true;
    }

    return Scaffold(
      body: SafeArea(
        // take the whole empty space
        child: Container(
          //
          child: IntroductionScreen(
              globalBackgroundColor: Color(0xff2196F3),
              color: Colors.white,
              dotsDecorator: _buildDotsDecorator(),
              pages: [
                PageViewModel(
                    titleWidget: Text(
                      "Добро пожаловать в\nLend Land!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Ты вступаешь в ряды настоящих легионеров, но перед этим тебе нужно неплохо так подлутаться",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    image: _buildImage('explore_circled.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    title: "Выполняй миссии от нашего легиона",
                    body:
                    "Тебе будут назначаться задания, с которыми можешь справиться только ты",
                    image: _buildImage('wallet.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    title: "Выполняй миссии от нашего легиона",
                    body:
                    "Тебе будут назначаться задания, с которыми можешь справиться только ты",
                    image: _buildImage('savings.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    title: "Выполняй миссии от нашего легиона",
                    body:
                        "Тебе будут назначаться задания, с которыми можешь справиться только ты",
                    image: _buildImage('analyze.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    title: "Миссия - это злодей. Одолей его!",
                    body:
                        "На каждом из этих заданий тебя ждет мини-монстр или баг, ты должен его одолеть!",
                    image: _buildImage('growth.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    title: "Не бойся, ты не один!",
                    body:
                        "Для решения задач тебе понадобится помощь твоих товарищей, так что вперед собирай команду!",
                    image: _buildImage('instant_info.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    title: "Доспехи - это твое все",
                    body:
                        "Победив монстра, вытащи все, что с него выпало, может пригодится)",
                    image: _buildImage('plans.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    title: "Победи всех монстров\nи стань легионером!",
                    body:
                        "Как только ты получил свои доспехи, только тогда станешь полноценным членом легиона",
                    image: _buildImage('progress_data.png'),
                    decoration: _buildPageDecoration()),
              ],
              dotsFlex: 2,
              onDone: () => _onIntroEnd(context),
              done: const Text('Вперед!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              showSkipButton: true,
              skip: const Text(
                ' Все\nзнаю!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              next: const Icon(Icons.arrow_forward)),
        ),
      ),
    );
  }
}
