import 'package:coupon_manager/db/db.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouponTitle {
  CouponTitle(this._id, this._title);

  final String _id;
  final String _title;

  String get id => _id;

  String get title => _title;
}

class EditBloc extends Bloc<CouponTitle, String> {
  EditBloc(String initialState) : super(initialState);

  @override
  Stream<String> mapEventToState(CouponTitle event) async* {
    if (event is CouponTitle) {
      await DB(documentId: event.id).editTitle(event.title);
       yield event.title;
    } else {
      print("Something went wrong");
    }
  }
}
