import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscountShow extends StatelessWidget {
  final double discount;

  const DiscountShow({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: Text(
          "Знижка " + discount.toString() + "%",
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.8)),
        ),
      ),
    );
  }
}
