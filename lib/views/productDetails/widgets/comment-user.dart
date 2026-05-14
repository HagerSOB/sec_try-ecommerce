import 'package:flutter/material.dart';
class Comments extends StatelessWidget {
  const Comments({
    super.key,
    required this.commentData,
  });

  final Map<String, dynamic>? commentData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // بيخلي الكلام يبدأ من الشمال
        children: [
          // اسم المستخدم
          Text(
            commentData?["user_name"] ?? "User Name",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          // التعليق
          Text(commentData?["comment"] ?? "No Comment"),

          const SizedBox(height: 10), // مسافة بسيطة

          // الجزء الخاص برد الأدمن
          if (commentData?["reply"] != null)
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // إزاحة للرد عشان يبان إنه تابع للتعليق
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Admin Reply",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  Text(commentData!["reply"]),
                ],
              ),
            ),
        ],
      ),
    );
  }
}