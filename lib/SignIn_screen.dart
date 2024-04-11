import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SignUp_screen.dart';
import 'Home_screen.dart';
import 'package:http/http.dart' as http;

bool isLoginSucess= true;

class SignScreen extends StatefulWidget {
  @override
  _SignScreenState createState() => _SignScreenState();

}


class _SignScreenState extends State<SignScreen> {
  late double fem;
  late double ffem;

  @override
  void initState() {
    super.initState();
    fem = 1.0;
    ffem = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 24 * fem),
              padding: EdgeInsets.fromLTRB(50 * fem, 80 * fem, 50 * fem, 0 * fem,),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFA7C4D4),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20 * fem),
                  bottomLeft: Radius.circular(20 * fem),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.345 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
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
                      'Sign In',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        height: 1.345 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Welcome Back!',
              style: GoogleFonts.robotoSerif(
                fontSize: 20 * ffem,
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontWeight: FontWeight.w400,
                height: 1.345 * ffem / fem,
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
                  SizedBox(height: 8.0),
                  RegistrationTextField(
                    hintText: 'E-Mail', controller: emailController,
                  ),
                  SizedBox(height: 8.0),


                  RegistrationTextField(
                    hintText: 'Passwort',
                    isPassword: true, controller: passwordController,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {

                loginToBackend();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Screen()));

              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFA7C4D4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(0* fem, 0 * fem, 0 * fem, 0 * fem),
                height: 61 * fem,
                width: 200 * fem,
                child: Center(
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.robotoSerif(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.345 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center, // Hier hinzugefügt
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            if (!isLoginSucess)
              Text(
                "Logindaten falsch", //show error text if Password is invalid
                style: const TextStyle(color: Colors.red),
              ),


            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 35 * fem, 0 * fem, 35* fem),
              width: double.infinity,
              height: 22 * fem,
              child: Center(
                child:
                Container(
                  child: Text(
                    '----- Or sign up with -----',
                    style: GoogleFonts.robotoSerif(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.345 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(38* fem, 15 * fem, 38 * fem, 70 * fem),
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
                          borderRadius: BorderRadius.circular(20 * fem),
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
                        borderRadius: BorderRadius.circular(45 * fem),
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
            SizedBox(height: 20),
            Container(
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFA7C4D4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20 * fem),
                  topRight: Radius.circular(20 * fem),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> loginToBackend() async {
  final email = emailController.text;
  final password = passwordController.text;
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8080/login'), // Adjust the endpoint URL accordingly
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    print('Login successful');
    return true;

    // Navigate to the homepage upon successful login
  } else {
    print('Login error: ${response.body}');
    return false;
    // Handle login failure, show error message, etc.
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: SignScreen(),
      ),
    );
  }
}

