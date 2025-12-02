import 'package:bob_mobile/models/signup_user_dto.dart';
import 'package:bob_mobile/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_app/analytics/analytics_module.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  var _isSigningUp = false;

  final UserService userService = Modular.get<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(width: 0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello.',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please use your credentials to login',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Form(
                    child: Column(
                      spacing: 8.0,
                      children: [
                        TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Your best email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: fullNameController,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Your name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            color: Theme.of(
                              context,
                            ).buttonTheme.colorScheme?.surface,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              side: BorderSide(width: 0.5),
                            ),
                            elevation: 1.0,
                            onPressed: () async {
                              try {
                                if (_isSigningUp) return;

                                _isSigningUp = true;

                                final isSuccess = await userService.signUp(
                                  SignupUserDto(
                                    username: emailController.text,
                                    password: passwordController.text,
                                    fullName: fullNameController.text,
                                  ),
                                );

                                if (isSuccess) {
                                  Modular.to.navigate('/');
                                  Fluttertoast.showToast(
                                    msg: 'Successfully signed up!',
                                  );
                                }
                              } catch (e) {
                                if (!context.mounted) return;

                                AnalyticsModule.sendEvent(
                                  'signup_error',
                                  <String, Object>{'error': e.toString()},
                                );

                                Fluttertoast.showToast(
                                  msg: 'Error signing up!',
                                );
                              } finally {
                                _isSigningUp = false;
                              }
                            },
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              Modular.to.navigate('/');
                            },
                            child: const Text(
                              "Already have an account? Sign In.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
