import 'dart:convert';

import 'package:first_project/home/signupBloc/signup_bloc.dart';
import 'package:first_project/home/signupBloc/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignIn_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/navigation/bloc/navigation_bloc.dart';
import 'home/navigation/bloc/navigation_event.dart';
import 'home/signupBloc/signup_event.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool isPasswordValid = true;
bool isUsernameValid = true;
bool isEmailValid = true;
bool isSignUpSuccess= false;

bool validatePassword(String password) {
  // validate the password
  // min 8 caracters, min 1 uper, 1 number
  return RegExp(r'^(?=.*[0-9])(?=.*[A-Z]).{8,}$').hasMatch(password);
}

bool validateUsername(String username) {
  //validate the username
  if (usernameController.text.length >= 3) // min 3 caracter
    return true;
  else
    return false;
}
bool validateEmail(String email) {
  //validate the email
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => SignupBloc(),
        child: Material(
          child: SignScreen(fem: 1.0, ffem: 1.0),
        ),
      ),
    );
  }
}


class SignScreen extends StatefulWidget {
  final double fem;
  final double ffem;

  SignScreen({required this.fem, required this.ffem});

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupGoToLoginState) {
          context.read<NavigationBloc>().add(NavigateSignUpToLogin());
        }
        /*else if (state is SignupSuccessState) {
          context.read<NavigationBloc>().add(NavigateSignUpToLogin());
        }*/

      },
      child: BlocBuilder<SignupBloc, SignupState>(
        builder: (context, state) {
          // Build UI components based on the current state
          // You can access state properties to conditionally display widgets
          return SingleChildScrollView(
            child: Container(

              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * widget.fem, 0 * widget.fem, 0 * widget.fem, 24 * widget.fem),
                    padding: EdgeInsets.fromLTRB(50 * widget.fem, 80 * widget.fem, 50 * widget.fem, 0 * widget.fem,),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFA7C4D4),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20 * widget.fem),
                        bottomLeft: Radius.circular(20 * widget.fem),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignInPage()),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Sign Up',
                            style: GoogleFonts.robotoSerif(
                              fontSize: 20 * widget.ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.345 * widget.ffem / widget.fem,
                              decoration: TextDecoration.underline,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            if (state is SignupGoToLoginState) {
                              context.read<NavigationBloc>().add(NavigateSignUpToLogin());
                            }
                            context.read<SignupBloc>().add(SignupGoToLoginEvent());
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignInPage()),
                            );*/
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.robotoSerif(
                              fontSize: 20 * widget.ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.345 * widget.ffem / widget.fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Create An Account',
                    style: GoogleFonts.robotoSerif(
                      fontSize: 20 * widget.ffem,
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontWeight: FontWeight.w400,
                      height: 1.345 * widget.ffem / widget.fem,
                      decoration: TextDecoration.underline,
                      color: Color(0xff000000),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    padding: EdgeInsets.only(top: 35.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [

                        RegistrationTextField(

                          hintText:'Username',
                          controller: usernameController,
                        ),
                        SizedBox(height: 9.0),
                        if (!isUsernameValid)
                          Text(
                            "Der Benutzername muss mindestens 3 Zeichen lang sein", //show error text if Password is invalid
                            style: const TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 8.0),
                        RegistrationTextField(
                          hintText: 'E-Mail',
                          controller: emailController,
                        ),
                        SizedBox(height: 9.0),
                        if (!isEmailValid)
                          Text(
                            "Die Email passt nicht.", //show error text if Password is invalid
                            style: const TextStyle(color: Colors.red),
                          ),
                        SizedBox(height: 8.0),
                        RegistrationTextField(
                          hintText: 'Passwort',
                          controller: passwordController,
                          isPassword: true,
                        ),
                        SizedBox(height: 9.0),
                        if (!isPasswordValid)
                          Text(
                            "Das Passwort muss mindestens 8 Zeichen, einen Großbuchstaben und eine Zahl haben.", //show error text if Password is invalid
                            style: const TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      isPasswordValid = validatePassword(passwordController.text); // check the validity
                      isUsernameValid = validateUsername(usernameController.text);
                      isEmailValid = validateEmail(emailController.text);
                      setState(() {});

                      if (isUsernameValid==true && isPasswordValid==true&& isEmailValid ==true){
                        final success =  signUpToBackend();
                        if (success==false){
                          isSignUpSuccess=true;
                          setState(() {});
                        }
                        if (state is SignupGoToLoginState) {
                          context.read<NavigationBloc>().add(NavigateSignUpToLogin());
                        }
                        context.read<SignupBloc>().add(SignupGoToLoginEvent());


                      }else {
                        //if (success==false) {



                          /*
                          context.read<SignupBloc>().add(
                              SignupButtonPressedEvent(
                                email: emailController.text,
                                  username: usernameController.text,
                                  password: passwordController.text,
                                  ));*/


                          /*Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignInPage()),
                          );*/
                        }
                     // }

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFA7C4D4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Container(
                      height: 61 * widget.fem,
                      width: 200 * widget.fem,
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.robotoSerif(
                            fontSize: 20 * widget.ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.345 * widget.ffem / widget.fem,
                            color: Color(0xff000000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.0),
                  if (isSignUpSuccess==true)
                    Text(
                      "Registrierung erfolgreich", //show error text if Password is invalid
                      style: const TextStyle(color: Colors.green),
                    ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * widget.fem, 35 * widget.fem, 0 * widget.fem, 35* widget.fem),
                    width: double.infinity,
                    height: 22 * widget.fem,
                    child: Center(
                      child:
                      Container(
                        child: Text(
                          '----- Or sign up with -----',
                          style: GoogleFonts.robotoSerif(
                            fontSize: 16 * widget.ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.345 * widget.ffem / widget.fem,
                            color: Color(0xff000000),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(38 * widget.fem, 15 * widget.fem, 38 * widget.fem, 70 * widget.fem),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20 * widget.fem),
                                child: Image.asset(
                                  'assets/Images/google.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20 * widget.fem),
                              child: Image.asset(
                                'assets/Images/facebook.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFA7C4D4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45 * widget.fem),
                        topRight: Radius.circular(45 * widget.fem),
                      ),
                    ),
                  ),
                ],
              ),
              // Your UI code here
            ),
          );
        },
      ),
    );
  }
}




class RegistrationTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const RegistrationTextField({
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: getPrefixIcon(),
      ),
    );
  }

  Icon getPrefixIcon() {
    if (hintText.toLowerCase().contains('username')) {
      return Icon(Icons.person);
    } else if (hintText.toLowerCase().contains('e-mail')) {
      return Icon(Icons.email);
    } else if (hintText.toLowerCase().contains('passwort')) {
      return Icon(Icons.lock);
    } else {
      return Icon(Icons.emoji_objects);
    }
  }
}

Future<bool> signUpToBackend() async {
  final email = emailController.text;
  final password = passwordController.text;
  final username= usernameController.text;
  isUsernameValid = validateUsername(usernameController.text);

  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print('Success: new user registered');
    return true;
  } else {
    print('Error registering: ${response.body}');
    return false;
  }
}


