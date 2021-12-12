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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
    return Container(child: Image.asset('images/$assetName', height: height));
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
                      "Добро пожаловать в\nLendLand!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Вы отваживаетесь сделать шаг в мир инвестиций - мир, полный перспективных идей, новых возможностей и весомого профита",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    image: _buildImage('explore_circled.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    titleWidget: Text(
                      "Вы - инвестор?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Многим стартапам нужно финансирование для старта. Инвестируйте в них, позвольте вашим деньгам работать на вас",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    image: _buildImage('savings.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    titleWidget: Text(
                      "Становитесь фигурой бизнеса",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Вы будете финансировать стартапы, бизнесы, проекты. Будете помогать им расти",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    image: _buildImage('career_ladder.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    titleWidget: Text(
                      "Оценивайте свои шансы",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Вы будете использовать графики, чарты, цифры, чтобы предсказывать будущее!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    image: _buildImage('metrix.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    titleWidget: Text(
                      "Хотите продвигать свой бизнес?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Регистрируйте свой технологический стартап - познакомьте ваш бизнес с другими",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    image: _buildImage('business_shop.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    titleWidget: Text(
                      "Находите инвесторов",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Получайте финансирование от людей, готовых поднимать вашу дефтельность вместе",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),

                    ),
                    image: _buildImage('business_deal.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    titleWidget: Text(
                      "Так выгоднее!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Text(
                      "Вы получаете помощь с заинтересованных людей, принимающие риски. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    image: _buildImage('discount.png'),
                    decoration: _buildPageDecoration()),
                PageViewModel(
                    titleWidget: Text(
                      "Есть идея, есть деньги - за дело!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                    bodyWidget: Container(),
                    // bodyWidget: Text(
                    //   "Есть идея, есть деньги - пора работать!",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(color: Colors.white, fontSize: 18),
                    // ),
                    image: _buildImage('powerful.png'),
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
