import 'package:flutter/cupertino.dart';
import "package:syncfusion_flutter_barcodes/barcodes.dart" show Code128, SfBarcodeGenerator;

class Barcode extends StatelessWidget {
  final String code;
  const Barcode({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: MediaQuery.of(context).size.height * 0.15,
      child: SfBarcodeGenerator(
        value: code,
        symbology: Code128(),
        showValue: true,
      ),
    );
  }
}
