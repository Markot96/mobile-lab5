import 'package:coupon_manager/components/create_coupon_view/create_coupon.dart';
import 'package:coupon_manager/components/start_view/start_view.dart';
import 'package:coupon_manager/db/db.dart';
import 'package:coupon_manager/db/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Coupon>>.value(
        value: DB(documentId: 'documentId').data,
        initialData: const [],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade900,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade700.withOpacity(0.8),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1000)),
                    ),
                    child: InkWell(
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 35,
                      ),
                      onTap: () {


                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>const CreateCoupon()),
                          );
                        //
                        // DB(documentId: "")
                        //     .setData("Планета владусиків", 9.99, 123212132);
                      },
                    ))
              ],
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    margin: const EdgeInsets.all(12),
                    child: Text(
                      "Ваші купони",
                      style: TextStyle(
                          fontSize: 26, color: Colors.white.withOpacity(0.9)),
                      textAlign: TextAlign.start,
                    )),
                const CouponList(),
              ],
            ),
          ),
          backgroundColor: Colors.grey.shade900,
        ));
  }
}
