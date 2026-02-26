import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/auth/ui/login-viwe.dart';
import 'package:ecommerce/views/auth/ui/register.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetState();
}

class _ResetState extends State<ResetPass> {
  String? _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 150),
                Text(
                  "Enter Your Email To Reset Your Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 60),
                Card(
                  color: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 25),
                        CustomTextField(
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
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryColor,
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginViwe()));
                              },
                              child: Text(
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
  }
}
