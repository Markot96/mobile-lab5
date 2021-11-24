import 'package:coupon_manager/bloc/edit_bloc.dart';
import 'package:coupon_manager/components/start_view/element/item.dart';
import 'package:coupon_manager/db/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CouponList extends StatelessWidget {
  const CouponList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<Coupon>>(context);
    return GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.5),
        children: data
            .map((coupon) => Item(
                  id: coupon.id,
                  name: coupon.name,
                  code: coupon.code,
                  discountPercent: coupon.discountPercent,
                ))
            .toList());
  }
}
