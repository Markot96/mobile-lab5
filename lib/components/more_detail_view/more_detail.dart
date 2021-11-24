import 'package:coupon_manager/bloc/edit_bloc.dart';
import 'package:coupon_manager/components/more_detail_view/elements/barcode.dart';
import 'package:coupon_manager/components/more_detail_view/elements/discount.dart';
import 'package:coupon_manager/components/more_detail_view/elements/edit_field.dart';
import 'package:coupon_manager/components/more_detail_view/elements/make_some_note.dart';
import 'package:coupon_manager/db/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreDetail extends StatelessWidget {
  final String id;
  final String title;
  final String code;
  final double discount;

  const MoreDetail(
      {Key? key,
      required this.title,
      required this.id,
      required this.code,
      required this.discount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double orientationHeight =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 1.5 : 1;

    return BlocProvider(
      create: (context) => EditBloc(title),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: const Text("Ваш купон"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 48),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height *
                        0.35 *
                        orientationHeight,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade500.withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade50.withOpacity(0.05),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            EditField(
                              id: id,
                              title: title,
                            ),
                            Barcode(code: code),
                            DiscountShow(discount: discount),
                          ],
                        )
                      ],
                    ),
                  ),
                  const MakeNotes(
                      icon: Icons.sticky_note_2_outlined,
                      title: "Ваші нотатки"),
                  const MakeNotes(
                      icon: Icons.format_list_bulleted_outlined,
                      title: "Список покупок")
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}
