import 'package:coupon_manager/db/db.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

TextEditingController nameController = TextEditingController();
TextEditingController codeController = TextEditingController();
TextEditingController discountController = TextEditingController();

class CreateCoupon extends StatelessWidget {
  const CreateCoupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double orientationHeight =
        (MediaQuery.of(context).orientation == Orientation.landscape) ? 1.5 : 1;
    addCoupon() async {
      DB(documentId: "")
          .setData(nameController.value.text, codeController.value.text,
              double.parse(discountController.value.text))
          .then((value) => {
                nameController.clear(),
                codeController.clear(),
                discountController.clear()
              })
          .then((value) {
        Navigator.pop(context);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Новий купон"),
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
                      0.45 *
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
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      hintText: "Введіть назву вашого купона",
                                      hintStyle: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Colors.white.withOpacity(0.8))),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-z A-Z]')),
                                  ],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white.withOpacity(0.8)),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: SfBarcodeGenerator(
                              value: "111222333444",
                              symbology: Code128(),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TextField(
                              controller: codeController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  hintText: "Введіть значення штрих-коду",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.8))),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white.withOpacity(0.8)),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: TextField(
                                controller: discountController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9 .]')),
                                ],
                                decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    hintText: "Введіть значення вашої знижки",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.8))),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: addCoupon,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: const Text(
                      "Додати купон",
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade900,
    );
  }
}
