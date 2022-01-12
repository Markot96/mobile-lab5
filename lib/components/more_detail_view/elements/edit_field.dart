import 'package:coupon_manager/bloc/edit_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditField extends StatelessWidget {
  final String id;
  final String title;

  const EditField({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
            margin: const EdgeInsets.all(12),
            child: BlocBuilder<EditBloc, String>(
              builder: (context, currentTitle) => TextFormField(
                initialValue: currentTitle,
                onChanged: (text) =>
                    BlocProvider.of<EditBloc>(context, listen: false)
                        .add(CouponTitle(id, text)),
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 24, color: Colors.white.withOpacity(0.8)),
              ),
            )));
  }
}
