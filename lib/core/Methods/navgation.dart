import 'package:flutter/material.dart';

Future<dynamic> buildPushReplacement( BuildContext context, Widget view) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => view), // شيلنا const وغيرنا الاسم
  );
}
