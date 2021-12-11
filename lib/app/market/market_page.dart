import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tomks_fintech_hack/app/market/widgets/filters.dart';
import 'package:tomks_fintech_hack/app/market/market_provider.dart';

class MarketPage extends ConsumerWidget {
  const MarketPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, watch) {
    final requestList = watch(requestsProvider);
    final pressedButton = watch(pressedButtonProvider);
    final searchCompany = watch(searchCompanyProvider);

    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15), // <-- Radius
    );

    _buildTextStyle({size = 14.0}) {
      return TextStyle(fontSize: size);
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 30)),
            Center(
              child: Text(
                "Рынок",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),

            Filters(),

            Padding(padding: EdgeInsets.only(top: 10)),

            requestList.when(
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, st) => Center(child: Text('Error: $error')),
              data: (retrievedRequests) {
                var data = retrievedRequests;
                var requests = null;
                if (searchCompany.state != "") {
                  requests = retrievedRequests.where((element) =>
                      element.companyName.toLowerCase().contains(searchCompany.state.toLowerCase())).toList();
                }

                if (requests != null) {
                  data = requests;
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: data.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // return the header
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(13, 71, 161, 0.15),
                                  //color of shadow
                                  blurRadius: 15,
                                  // blur radius
                                  offset:
                                  Offset(-2, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: new Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text("компания", style: _buildTextStyle()),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "рейтинг",
                                    style: _buildTextStyle(),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "собрано",
                                    style: _buildTextStyle(),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    "ставка",
                                    style: _buildTextStyle(),
                                  )),
                            ],
                          ),
                        );
                      }
                      index -= 1;

                      if (pressedButton.state == CATEGORY_UP) {
                        data.sort((req1, req2) =>
                            req1.companyName.compareTo(req2.companyName));
                      }
                      if (pressedButton.state == CATEGORY_DOWN) {
                        data.sort((req1, req2) =>
                            req2.companyName.compareTo(req1.companyName));
                      }
                      if (pressedButton.state == RATING_UP) {
                        data.sort((req1, req2) => req1.rating
                            .toLowerCase()
                            .compareTo(req2.rating.toLowerCase()));
                      }
                      if (pressedButton.state == RATING_DOWN) {
                        data.sort((req1, req2) => req2.rating
                            .toLowerCase()
                            .compareTo(req1.rating.toLowerCase()));
                      }
                      if (pressedButton.state == RATE_UP) {
                        data.sort((req1, req2) => req2.rate.compareTo(req1.rate));
                      }
                      if (pressedButton.state == RATE_DOWN) {
                        data.sort((req1, req2) => req1.rate.compareTo(req2.rate));
                      }



                      return Container(
                        height: 50,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: index == data.length - 1
                                    ? Color.fromRGBO(13, 71, 161, 0.15)
                                    : Colors.white,
                                //color of shadow
                                blurRadius: 15,
                                // blur radius
                                offset: index == data.length - 1
                                    ? Offset(-2, 20)
                                    : Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            borderRadius: index == data.length - 1
                                ? BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))
                                : BorderRadius.zero),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Icon(Icons.supervised_user_circle),
                                      Padding(
                                          padding: EdgeInsets.only(right: 10)),
                                      Text(
                                        data[index].companyName,
                                        style: _buildTextStyle(),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data[index].rating,
                                    style: _buildTextStyle(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data[index].minPayment.toString(),
                                    style: _buildTextStyle(),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${data[index].rate.toString()}%',
                                    style: _buildTextStyle(),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 1,
                              thickness: 0.5,
                              indent: 0,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            ),

          ],
        ),
      ),
    );
  }
}
