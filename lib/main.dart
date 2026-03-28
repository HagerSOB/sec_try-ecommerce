import 'package:ecommerce/constains.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/auth/ui/login-viwe.dart';
import 'package:ecommerce/views/navBar/UI/NavBarView.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Cons.URL,
    anonKey: Cons.annacK,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.kScaffoldColor),
      home:  Mainhomeview(),
    );
  }
}


