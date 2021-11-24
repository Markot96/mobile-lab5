import 'dart:math';

import 'package:coupon_manager/components/more_detail_view/more_detail.dart';
import 'package:coupon_manager/db/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String id;
  final String name;
  final double discountPercent;
  final String code;

  const Item(
      {Key? key,
      required this.name,
      required this.discountPercent,
      required this.id,
      required this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (event) => DB(documentId: id).delete(),
      child: InkWell(
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors
                .primaries[Random().nextInt(Colors.primaries.length)].shade500
                .withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                discountPercent.toString() + "%",
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MoreDetail(
                      id: id,
                      title: name,
                      code: code,
                      discount: discountPercent,
                    )),
          );
        },
      ),
    );
  }
}
