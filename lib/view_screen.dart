import 'package:first_project/AgePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';


class ViewScreen extends StatefulWidget {
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  bool isBottomSheetVisible = true;
  int currentImageIndex = 0;
  late List<String> backgroundImages = [
    'assets/Images/fille_3.jpg',
    'assets/Images/fille_4.jpg',
    'assets/Images/love_1.jpg',
    'assets/Images/love_2.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % backgroundImages.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(backgroundImages[currentImageIndex]),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height /1/2),
                YourContentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class YourContentWidget extends StatefulWidget {
  @override
  _YourContentWidgetState createState() => _YourContentWidgetState();
}

class _YourContentWidgetState extends State<YourContentWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(23, 24 , 23.5 , 0),
        width: double.infinity,
        height: 413,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(59),
            topRight: Radius.circular(59),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 54, top:15),
                    child: Text(
                      'Ex zurückgewinnen',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        color: Color(0xff000000),
                        decorationColor: Color(0xff000000),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Aktion für Share
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
                      color: isFavorite?Colors.red: Colors.black,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
              constraints: BoxConstraints(
                maxWidth: 368,
              ),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: GoogleFonts.robotoSerif(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text:
                      'Der Ex zurück Chancen-Test wurde sorgfältig erstellt. Bitte beachte, dass die Resultate von Person zu Person verschieden sein können und der Test keine definitiven Aussagen machen kann, ob du und dein:e Ex garantiert wieder zusammenkommt oder nicht. ',
                    ),
                    TextSpan(
                      text:
                      'Der Test gibt dir vielmehr einen Anhaltspunkt, sodass du für dich entscheiden kannst, ob du deine:n Ex zurückerobern möchtest.',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15),
              height: 61 ,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFA7C4D4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                ),
                child: Center(
                  child: Text(
                    'Test durchführen',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoSerif(
                      fontSize: 16 ,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: ViewScreen(),
      ),
    );
  }
}


