import 'package:ecommerce/constains.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/my-observer.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-cubit.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-state.dart';
import 'package:ecommerce/views/auth/ui/login-viwe.dart';
import 'package:ecommerce/views/navBar/UI/NavBarView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Cons.URL,
    anonKey: Cons.annacK,
  );
  Bloc.observer=myObserver();
  runApp(
    BlocProvider(
      create: (BuildContext context) => AuthCubit()..GetUserData(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SupabaseClient client = Supabase.instance.client;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.kScaffoldColor),

      home: BlocBuilder<AuthCubit, AuthenState>(
        builder: (context, state) {
          if (client.auth.currentUser == null) {
            return const LoginViwe();
          }

          if (state is GetDataLoading ||
              state is UserDataAddLoading ||
              context.read<AuthCubit>().currentUserModel == null) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is GetDataError) {
            return const Scaffold(
              body: Center(child: Text('حدث خطأ ما أثناء جلب البيانات')),
            );
          }

          return Mainhomeview(
            userModel: context.read<AuthCubit>().currentUserModel!,
          );
        },
      ),
    );
  }
}