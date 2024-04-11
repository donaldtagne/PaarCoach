import 'package:first_project/AgePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: SizedBox(
            width: 283,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Username',
                  style: GoogleFonts.robotoSerif(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'wählen Sie eine Option aus!',
                  style: GoogleFonts.robotoSerif(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 160,
                      height: 230,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgePage()),
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/Images/fille_3.jpg',
                            fit: BoxFit.cover,
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 12,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 78,
                      height: 29,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewPage()),
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'view...',
                          style: GoogleFonts.robotoSerif(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 165 ,
                  child: Container(
                    width: 150,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  top: 180,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 160,
                      height: 50,
                      child: Text(
                        'Dein/Deine Ex\n zurückgewinnen?',
                        style: GoogleFonts.robotoSerif(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.only(right: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 160,
                      height: 230,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/Images/love_2.jpg',
                            fit: BoxFit.cover,
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 12,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 78,
                      height: 29 ,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewPage()),
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'view...',
                          style: GoogleFonts.robotoSerif(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 165,
                  child: Container(
                    width: 150,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 18,
                  top: 180,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 160,
                      height: 50 ,
                      child: Text(
                        'Besser werden in\n der Beziehung?',
                        style: GoogleFonts.robotoSerif(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 160,
                      height: 230,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/Images/stress_1.jpg',
                            fit: BoxFit.cover,
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 12,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 78,
                      height: 29,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewPage()),
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'view...',
                          style: GoogleFonts.robotoSerif(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 168,
                  child: Container(
                    width: 160 ,
                    height: 68 ,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 18,
                  top: 180 ,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 170 ,
                      height: 50 ,
                      child: Text(
                        'Verhalten nach\n der Trennung?',
                        style: GoogleFonts.robotoSerif(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6 ),
                  padding: EdgeInsets.only(right: 16 ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 160,
                      height: 230,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/Images/stress.jpg',
                            fit: BoxFit.cover,
                            width: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 12 ,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 78 ,
                      height: 29 ,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewPage()),
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'view...',
                          style: GoogleFonts.robotoSerif(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 1.1725,
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16 ,
                  top: 165 ,
                  child: Container(
                    width: 150 ,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 18 ,
                  top: 178,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 160,
                      height: 50 ,
                      child: Text(
                        'Verhalten auf dem ersten Date\nnach der Trennung?',
                        style: GoogleFonts.robotoSerif(
                          fontSize: 14 ,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}