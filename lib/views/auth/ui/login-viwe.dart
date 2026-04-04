import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-cubit.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-state.dart';
import 'package:ecommerce/views/auth/ui/register.dart';
import 'package:ecommerce/views/auth/ui/reset_password_view.dart';
import 'package:ecommerce/views/navBar/UI/NavBarView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViwe extends StatefulWidget {
  const LoginViwe({super.key});

  @override
  State<LoginViwe> createState() => _LoginState();
}

class _LoginState extends State<LoginViwe> {
  String? _email;
  String? _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 late final TextEditingController   emailController;
  late final TextEditingController   passwordController;
bool IsbasswordHide=true;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthenState>(
      builder: (BuildContext context, AuthenState state) {
        AuthCubit cubit=context.read<AuthCubit>();
        return Scaffold(
        body: state is LoginLoading? CutomCirucleIND() : SingleChildScrollView(
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
                       controller: emailController,
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
                            }, controller: passwordController,
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
                                onPressed: () {
                                  cubit.login(email: emailController.text, password: passwordController.text);
                                },
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
      },
      listener: (BuildContext context, AuthenState state) {
        if (state is LoginSuccses) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mainhomeview()));
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

}
