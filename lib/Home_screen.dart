import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';
import 'communities.dart';
import 'Profile.dart';
import 'Experte.dart';

import 'Notify.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFFA7C4D4);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(
          myColor.value, // Use the integer value of your custom color

          <int, Color>{
            50: Color(0xFFE1ECF2),
            100: Color(0xFFB3D2E1),
            200: Color(0xFF80B9CF),
            300: Color(0xFF4D9FBF),
            400: Color(0xFF268EB3),
            500: Color(0xFFA7C4D4), // Primary value for the swatch
            600: Color(0xFF1E789E),
            700: Color(0xFF1B6C8B),
            800: Color(0xFF185E79),
            900: Color(0xFF134C60),
          },
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: GoogleFonts.robotoSerif(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          selectedLabelStyle: GoogleFonts.robotoSerif(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool isMenuOpen = false;
  bool isDarkMode = false;


  final List<Widget> _pages = [
    HomePage(),
    ExpertsPage(),
    CommunityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Paar Coach',
          style: GoogleFonts.robotoSerif(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xff000000),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
              ],
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              setState(() {
                isMenuOpen = !isMenuOpen;
              });
              if (isMenuOpen) {
                _showBottomSheet(context);
              }
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFA7C4D4),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_in_talk_rounded),
            label: 'Experten',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    bool isDarkMode=false;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 3 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text(
                      'Edit Profile',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        color:Colors.black
                      ),
                    ),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Account Settings',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        color:Colors.black
                      ),
                    ),
                    onTap: () {
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(
                      'Push Notifications',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        color:Colors.black
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.nightlight_round),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark Mode',
                          style: GoogleFonts.robotoSerif(
                            fontSize: 16,
                            color:Colors.black
                          ),
                        ),
                        Switch(
                          value: isDarkMode,
                          onChanged: (value) {
                            if (isDarkMode!= value) {
                              setState(() {
                                isDarkMode = value;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text(
                      'Change Password',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        color:Colors.black
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.subscriptions),
                    title: Text(
                      'Manage Subscription',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                         color:Colors.black
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.analytics),
                    title: Text(
                      'Analytics',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        color:Colors.black
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        color:Colors.black
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text(
                      'Delete Account',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        color:Colors.black
                      ),
                    ),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}











