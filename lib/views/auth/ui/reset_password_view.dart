import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-cubit.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-state.dart';
import 'package:ecommerce/views/auth/ui/login-viwe.dart';
import 'package:ecommerce/views/auth/ui/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../CustomWidgets/custom_cirucle_ind.dart';
import '../../../core/Methods/navgation.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetState();
}

class _ResetState extends State<ResetPass> {
  String? _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController EmailController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AuthCubit,AuthenState>(
      builder: (BuildContext context, state) {
         return state is ResetPassLoading? const CutomCirucleIND(): Scaffold(
           body: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Center(
                 child: Column(
                   children: [
                     const SizedBox(height: 150),
                     const Text(
                       "Enter Your Email To Reset Your Password",
                       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                     ),
                     const SizedBox(height: 60),
                     Card(
                       color: AppColors.kWhiteColor,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(16)),
                       child: Form(
                         key: _formKey,
                         child: Column(
                           children: [
                             const SizedBox(height: 25),
                             CustomTextField(
                               controller:  EmailController,
                               hintText: 'email',
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'please enter your email';
                                 }
                               },
                               onChanged: (value) {
                                 setState(() {
                                   _email = value;
                                 });
                               },
                             ),
                             const SizedBox(height: 25),
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8),
                               child: Container(
                                 width: double.infinity,
                                 child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: AppColors.kPrimaryColor,
                                     padding: const EdgeInsets.symmetric(vertical: 15.0),
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(12),
                                     ),
                                   ),
                                   onPressed: () async{
                                     if (_formKey.currentState!.validate()) {
                                      await context.read<AuthCubit>().ForgetPass(email:EmailController.text);                                    // ملاحظة: مش بنعمل Navigator هنا.. الـ Listener هو اللي هيقوم بالمهمة دي
                                     }
                                   },
                                   child: const Text(
                                     "Reset Password",
                                     style: TextStyle(
                                         color: Colors.white, fontSize: 22),
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         );

      },
      listener: (BuildContext context, state) {
        if (state is ResetPassSuccses) {
          Navigator.pop(context);
        }
      },
    );
  }
@override
  void dispose() {
    // TODO: implement dispose
    EmailController.dispose();
    super.dispose();


}
}
