import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/market/market_provider.dart';
import 'package:tomks_fintech_hack/data/request.dart';

class RequestPage extends ConsumerWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final chosenRequest = watch(chosenRequestProvider);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 200,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fitWidth,
                    // alignment: FractionalOffset.center,
                    image: Image.asset('images/${chosenRequest.state?.photo}')
                        .image,
                    // Image.asset('images/candle_photo.png').image,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(13, 71, 161, 0.15),
                        //color of shadow
                        blurRadius: 15,
                        // blur radius
                        offset: Offset(-2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                      '${chosenRequest.state?.accumulatedSum}/${chosenRequest.state?.softCap}'),
                ),
              ),

              Container(
                height: 400,
              )

              // Text('Page of ${chosenRequest.state?.companyName}'),
            ]),
          ],
        ),
      ),
    );
  }
}
