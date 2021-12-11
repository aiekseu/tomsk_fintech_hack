import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableHeader extends ConsumerWidget {
  const TableHeader({Key? key}) : super(key: key);

  _buildTextStyle({size = 14.0}) {
    return TextStyle(fontSize: size);
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("компания",style: _buildTextStyle()),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "рейтинг",
                    textAlign: TextAlign.center,
                    style: _buildTextStyle(),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    "собрано",
                    textAlign: TextAlign.center,
                    style: _buildTextStyle(),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    "ставка",
                    textAlign: TextAlign.center,
                    style: _buildTextStyle(),
                  )),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
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
  }

}