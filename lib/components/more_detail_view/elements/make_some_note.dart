import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeNotes extends StatelessWidget {
  final IconData icon;
  final String title;
  const MakeNotes({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      color:   Colors.grey.shade700,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children:  [Text(title,style: TextStyle(fontSize: 24,color: Colors.grey.shade300),), Icon(icon,color: Colors.grey.shade300,size: 35,)],
      ),
    );
  }
}
