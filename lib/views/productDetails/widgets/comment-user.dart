import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        children: [
          Text("User Name",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
        ],
      ),
      Row(
        children: [
          Text("User Name"),
        ],
      ), Row(
        children: [
          Text("Admin Rep",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
        ],
      ),
      Row(
        children: [
          Text("Admin Rep...."),
        ],
      )

    ],);
  }
}
