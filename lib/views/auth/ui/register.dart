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
  State<RegisterViwe> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterViwe> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool isPasswordHide = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthenState>(
      listener: (BuildContext context, state) {
        if (state is SignUpSuccses) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  Mainhomeview())
          );
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message))
          );
        }
      },
      builder: (BuildContext context, state) {
        AuthCubit cubit = context.read<AuthCubit>();

        return Scaffold(
          body: state is SignUpLoading
              ? const CutomCirucleIND()
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    const Text(
                      "Welcome to our market",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 40),
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
                              controller: nameController,
                              hintText: 'Name',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              controller: emailController,
                              hintText: 'Email',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Missing @';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: isPasswordHide,
                              SuuffIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHide = !isPasswordHide;
                                    });
                                  },
                                  icon: Icon(isPasswordHide
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ),
                            const SizedBox(height: 25),
                            CustomTextField(
                              controller: confirmPassController,
                              hintText: 'Confirm Password',
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 25),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kPrimaryColor,
                                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.Register(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have account"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginViwe()),
                                    );
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
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
                                  side: const BorderSide(color: Colors.white),
                                ),
                                onPressed: () {
                                  cubit.signInWithGoogle();
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
                                      style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
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
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}