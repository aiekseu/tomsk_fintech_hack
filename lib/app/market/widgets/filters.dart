import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/market/market_provider.dart';

class Filters extends ConsumerWidget {
  const Filters({Key? key}) : super(key: key);

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

  _buildSearchInputDecoration(hintText) {
    return InputDecoration(
      suffixIcon: Icon(
        Icons.search,
        color: Color(0xff42A5F5),
      ),
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

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final categoryArrowUp = watch(categoryArrowUpProvider);
    final reliabilityArrowUp = watch(reliabilityArrowUpProvider);
    final rateArrowUp = watch(rateArrowUpProvider);
    final pressedButton = watch(pressedButtonProvider);
    final searchCompany = watch(searchCompanyProvider);

    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // <-- Radius
    );

    return Column(
      children: [
        Container(
          decoration: _buildShadowBox(),
          child: TextField(
            obscureText: false,
            decoration: _buildSearchInputDecoration('Поиск'),
            onChanged: (text) {
              searchCompany.state = text;
            },
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: _buildShadowBox(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shape: roundedRectangleBorder),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Категория",
                        style: TextStyle(fontSize: 14, color: Colors.black87)),
                    Icon(
                        categoryArrowUp.state
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down_outlined,
                        color: Color(0xff42A5F5))
                  ],
                ),
                onPressed: () {
                  categoryArrowUp.state = !categoryArrowUp.state;
                  pressedButton.state = pressedButton.state != CATEGORY_UP ? CATEGORY_UP : CATEGORY_DOWN;
                },
              ),
            ),
            Container(
              decoration: _buildShadowBox(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shape: roundedRectangleBorder),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Надежность",
                        style: TextStyle(fontSize: 14, color: Colors.black87)),
                    Icon(
                        reliabilityArrowUp.state
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down_outlined,
                        color: Color(0xff42A5F5))
                  ],
                ),
                onPressed: () {
                  reliabilityArrowUp.state = !reliabilityArrowUp.state;
                  pressedButton.state = pressedButton.state != RATING_UP ? RATING_UP : RATING_DOWN;
                },
              ),
            ),
            Container(
              decoration: _buildShadowBox(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shape: roundedRectangleBorder),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ставка",
                        style: TextStyle(fontSize: 14, color: Colors.black87)),
                    Icon(
                        rateArrowUp.state
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down_outlined,
                        color: Color(0xff42A5F5))
                  ],
                ),
                onPressed: () {
                  rateArrowUp.state = !rateArrowUp.state;
                  pressedButton.state = pressedButton.state != RATE_UP ? RATE_UP : RATE_DOWN;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
