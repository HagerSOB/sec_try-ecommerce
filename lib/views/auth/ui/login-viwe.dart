import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/auth/ui/register.dart';
import 'package:ecommerce/views/auth/ui/reset_password_view.dart';
import 'package:ecommerce/views/navBar/UI/NavBarView.dart';
import 'package:flutter/material.dart';

class LoginViwe extends StatefulWidget {
  const LoginViwe({super.key});

  @override
  State<LoginViwe> createState() => _LoginState();
}

class _LoginState extends State<LoginViwe> {
  String? _email;
  String? _password;
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
                SizedBox(height: 100),
                Text(
                  "Welcome to our market",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 70),
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
                          hintText: 'Email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your email';
                            }

                            if (!value.contains('@')) {
                              return ' missing @';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                        SizedBox(height: 25),
                        CustomTextField(
                          hintText: 'password',
                          SuuffIcon: IconButton(
                              onPressed: () {}, icon: Icon(Icons.visibility_off)),
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              _password = value;
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
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              GestureDetector(onTap: (){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => ResetPass()),
                                );
                              },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      const  SizedBox(height:15 ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("don't have account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterViwe()),
                                );
                              },
                              child: Text(
                                "Sing in",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              side:BorderSide(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainhomeview()));
                              print("Google Sign-in clicked");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',                                height: 24,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  "Sign in with Google",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
