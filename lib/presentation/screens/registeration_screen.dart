import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/business_logic/bloc/auth_bloc/auth_bloc.dart';
import 'package:la_vie/business_logic/bloc/auth_bloc/auth_event.dart';
import 'package:la_vie/business_logic/bloc/auth_bloc/auth_state.dart';
import 'package:la_vie/constants/strings.dart';
import 'package:la_vie/data/repository/auth_repository.dart';
import 'package:la_vie/presentation/screens/home_screen.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);
  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen>
    with TickerProviderStateMixin {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthLoginBloc authLoginBloc;
  late AuthSignupBloc authSignupBloc;

  @override
  void initState() {
    authLoginBloc = BlocProvider.of<AuthLoginBloc>(context);
    authSignupBloc = BlocProvider.of<AuthSignupBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final msgLogin = BlocBuilder<AuthLoginBloc, AuthLoginState>(
      builder: (context, state) {
        if (state is LoginErrorState) {
          return Text(state.message);
        } else if (state is LoginLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
    final msgSignup = BlocBuilder<AuthSignupBloc, AuthSignupState>(
      builder: (context, state) {
        if (state is SignupErrorState) {
          return Text(state.message);
        } else if (state is SignupLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
    TabController? _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Image.asset(
                'assets/images/leaf_top.png',
                scale: 3,
              ),
            ),
            Image.asset(
              'assets/images/splash.png',
              scale: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TabBar(
                controller: _tabController,
                indicatorColor: Color.fromARGB(255, 26, 188, 0),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Color.fromARGB(255, 138, 138, 138),
                labelColor: Color.fromARGB(255, 26, 188, 0),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Text(
                    "Sign up",
                  ),
                  Text(
                    "Login",
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'First Name',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 111, 111, 111),
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: firstNameController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            width: 0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Last Name',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 111, 111, 111),
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: lastNameController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                            width: 0,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'E-mail',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 111, 111, 111),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 111, 111, 111),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Confirm Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 111, 111, 111),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                //controller: confirmPasswordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      width: 0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25, top: 0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'E-mail',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 111, 111, 111),
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 111, 111, 111),
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  if (firstNameController.text.isEmpty) {
                    authLoginBloc.add(
                      LoginButtonPressed(
                          email: emailController.text,
                          password: passwordController.text),
                    );
                  } else {
                    authSignupBloc.add(
                      SignupButtonPressed(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  }
                },
                color: Color.fromARGB(255, 26, 188, 0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            dividerWithText(),
            gfBotLeaf(),
            BlocListener<AuthLoginBloc, AuthLoginState>(
              listener: (context, state) {
                if (state is UserLoginSuccessState) {
                  Navigator.pushNamed(context, homeScreenRoute);
                }
              },
              child: Container(),
            ),
            BlocListener<AuthSignupBloc, AuthSignupState>(
              listener: (context, state) {
                if (state is UserSignupSuccessState) {
                  Navigator.pushNamed(context, homeScreenRoute);
                }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget signUpForm() {
//   final _formKey = GlobalKey<FormState>();
//   return Form(
//     key: _formKey,
//     child: Padding(
//       padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Flexible(
//                   child: firstNameTextField(),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Flexible(
//                   child: lastNameTextField(),
//                 ),
//               ],
//             ),
//             emailTextField(),
//             passwordTextField(),
//             confirmPasswordTextField(),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget firstNameTextField() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text(
//         'First Name',
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: Color.fromARGB(255, 111, 111, 111),
//           fontFamily: 'Roboto',
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       TextField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//               width: 0,
//               style: BorderStyle.solid,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget lastNameTextField() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text(
//         'Last Name',
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: Color.fromARGB(255, 111, 111, 111),
//           fontFamily: 'Roboto',
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//               width: 0,
//               style: BorderStyle.solid,
//             ),
//           ),
//         ),
//         validator: (value) => null,
//       )
//     ],
//   );
// }

// Widget emailTextField() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const SizedBox(
//         height: 20,
//       ),
//       const Text(
//         'E-mail',
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: Color.fromARGB(255, 111, 111, 111),
//           fontFamily: 'Roboto',
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       TextFormField(
//         //controller: EmailorUserController,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//               width: 0,
//               style: BorderStyle.solid,
//             ),
//           ),
//         ),
//         validator: (value) => null,
//       ),
//     ],
//   );
// }

// Widget passwordTextField() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const SizedBox(
//         height: 20,
//       ),
//       const Text(
//         'Password',
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: Color.fromARGB(255, 111, 111, 111),
//           fontFamily: 'Roboto',
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       TextFormField(
//         //controller: EmailorUserController,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//               width: 0,
//               style: BorderStyle.solid,
//             ),
//           ),
//         ),
//         validator: (value) => null,
//       ),
//     ],
//   );
// }

// Widget confirmPasswordTextField() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const SizedBox(
//         height: 20,
//       ),
//       const Text(
//         'Confirm Password',
//         style: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: Color.fromARGB(255, 111, 111, 111),
//           fontFamily: 'Roboto',
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       TextFormField(
//         //controller: EmailorUserController,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: const BorderSide(
//               width: 0,
//               style: BorderStyle.solid,
//             ),
//           ),
//         ),
//         validator: (value) => null,
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//     ],
//   );
// }

// Widget loginButton() {
//   return Padding(
//     padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
//     child: MaterialButton(
//       minWidth: double.infinity,
//       height: 60,
//       onPressed: () {
//         authBloc.add(LoginButtonPressed(email: email, password: password));
//       },
//       color: Color.fromARGB(255, 26, 188, 0),
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: const Text(
//         "Login",
//         style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontFamily: 'Roboto',
//           fontSize: 16,
//           color: Colors.white,
//         ),
//       ),
//     ),
//   );
// }

Widget dividerWithText() {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
    child: Row(
      children: const <Widget>[
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color.fromARGB(255, 151, 151, 151),
            endIndent: 5,
          ),
        ),
        Text(
          "or continue with",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color.fromARGB(255, 151, 151, 151),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color.fromARGB(255, 151, 151, 151),
            indent: 5,
          ),
        ),
      ],
    ),
  );
}

Widget gfBotLeaf() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 125, top: 15),
        child: Row(
          children: <Widget>[
            GestureDetector(
              child: Image.asset(
                'assets/images/Google.png',
                scale: 2,
              ),
              onTap: () {},
            ),
            const SizedBox(
              width: 30,
            ),
            GestureDetector(
              child: Image.asset(
                'assets/images/Facebook.png',
                scale: 2,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 150, top: 0, bottom: 5),
        child: Image.asset(
          'assets/images/leaf_bot.png',
          scale: 2,
        ),
      ),
    ],
  );
}
