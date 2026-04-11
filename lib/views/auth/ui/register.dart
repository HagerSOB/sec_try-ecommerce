import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-cubit.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-state.dart';
import 'package:ecommerce/views/auth/ui/login-viwe.dart';
import 'package:ecommerce/views/navBar/UI/NavBarView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';


class RegisterViwe extends StatefulWidget {
  const RegisterViwe({super.key});

  @override
  State<RegisterViwe> createState() => _LoginState();
}

class _LoginState extends State<RegisterViwe> {
  String? _email;
  String? _password;
  String? _Name;
  String? _confirmPassword;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool IsbasswordHide=true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthenState>(
      builder: (BuildContext context, state) {
        AuthCubit cubit=context.read<AuthCubit>();
        return  Scaffold(
          body: state is SignUpLoading ? CutomCirucleIND() : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Text(
                      "Welcome to our market",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40),
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
                              hintText: 'Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter your Name';
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  _Name = value;
                                });
                              },
                            ),
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
                              obscureText: IsbasswordHide,

                              SuuffIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      IsbasswordHide = !IsbasswordHide;
                                    });
                                  },
                                  icon: Icon( IsbasswordHide ? Icons.visibility: Icons.visibility_off)),
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                            ),
                            SizedBox(height: 25),
                            CustomTextField(
                              hintText: 'Confirm Password',
                              obscureText: true,
                              onChanged: (value) {
                                setState(() {
                                  _confirmPassword = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _password) {
                                  return 'Passwords do not match';
                                }
                                return null;
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
                                    if (_formKey.currentState!.validate()) {
                                      cubit.Register(
                                        name: _Name ?? '',
                                        email: _email ?? '',
                                        password: _password ?? '',
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Sing Up",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have account"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginViwe()),
                                    );
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
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
                                  side: BorderSide(color: Colors.white),
                                ),
                                onPressed: () {
                                  cubit.signInWithGoogle();
                                  print("Google Sign-in clicked");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
                                      height: 24,
                                    ),
                                    const SizedBox(width: 12),
                                    const Text(
                                      "Sign Up with Google",
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
      }, listener: (BuildContext context, Object? state) {
      if (state is SignUpSuccses) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mainhomeview()));
      } else if (state is SignUpError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
      }
    },

    );
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
