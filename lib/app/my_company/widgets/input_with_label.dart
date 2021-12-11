import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputWithLabel extends ConsumerWidget {
  const InputWithLabel(
      {Key? key, required this.label, required this.stateProvider, required this.controller})
      : super(key: key);

  final String label;
  final dynamic stateProvider;
  final TextEditingController controller;

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

  _buildInputDecoration() {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: EdgeInsets.all(8),
      hintText: '',
    );
  }

  @override
  Widget build(BuildContext context, watch) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.label),
          Container(
            decoration: _buildShadowBox(),
            child: TextField(
              obscureText: false,
              controller: controller,
              decoration: _buildInputDecoration(),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                this.stateProvider.state = text;
              },
            ),
          ),
        ],
      ),
    );
  }
}
