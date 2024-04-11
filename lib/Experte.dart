import 'package:first_project/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ExpertsPage extends StatefulWidget {
  @override
  _ExpertsPageState createState() => _ExpertsPageState();
}

class _ExpertsPageState extends State<ExpertsPage> {
  int visibleItemCount = 5;
  bool _showMoreItems = false;
  bool isFilterActive = false;
  List<double> ratings = [4.0, 5.0, 3.8, 3.5, 2.9];
  List<bool> isFavoriteList = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Experten',
                style: GoogleFonts.robotoSerif(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: isFilterActive
                        ? Icon(Icons.filter_alt_off_sharp)
                        : Icon(Icons.filter_alt_sharp),
                    onPressed: () {
                      setState(() {
                        isFilterActive = !isFilterActive;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFilterActive = !isFilterActive;
                      });
                    },
                  child: Text(
                    'Filtern',
                    style: GoogleFonts.robotoSerif(
                      fontSize: 14,
                      color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ]
            ),
            SizedBox(height: 10.0),
            Text(
              'Expertenrat für Ihren Weg zum Erfolg',
              style: GoogleFonts.robotoSerif(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: 417,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/Images/expert.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Wie gut passt ihr zusammen?\nSprich mit unseren Berater:innen",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.robotoSerif(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Unsere Top Berater:innen\n warten auf dich",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoSerif(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'New Expert',
                        style: GoogleFonts.robotoSerif(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        visibleItemCount +=0;
                        _showMoreItems = true;
                      });
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildBlackContainer("assets/Images/susanne.jpg", "🟢Alfred Müller (On) ","52800 Gespräche", "♊️ Zwillinge","🏙️ Berlin (500 km)" ,0, "4.9","Hallo! Als Beziehungsexperte\nunterstütze ich Paare dabei, tiefe\nVerbindungen zu schaffen und\ngemeinsam die Höhen und Tiefen\ndes Lebens zu meistern."),
                  _buildBlackContainer("assets/Images/maier.jpg", "🔴Maier stadler (Off) ", "15000 Gespräche","♏ Skorpion ","🏙️ Bassel (350 km)" ,1,"5.0","Herzlich willkommen! In meiner\nRolle als Beziehungsexperte\narbeite ich daran, Liebe und Ver-\nständnis zu fördern."),
                  _buildBlackContainer("assets/Images/monika.jpg", "🟡Monika Gram (Off) ", "14500 Gespräche","♊️ Zwillinge", "🏙️ Mainz (100 km)",2,"3.8", "Guten Tag! Als erfahrener Bezie-\nhungsexperte begleite ich Paare\nauf dem Weg zu einer gesunden,\nrespektvollen und erfüllenden\nPartnerschaft."),
                  _buildBlackContainer("assets/Images/lea.jpg", "🔴Lea Weber (Off)", "50230 Gespräche","♍ Jungfrau ","🏙️ Essen (610 km)" ,3,"3.5", "Grüße! Mit meinem Fachwissen\n alsBeziehungsexperte helfe ich\nPaaren, Konflikte zu lösen, die\nLiebe zu vertiefen."),
                  _buildBlackContainer("assets/Images/jonas.jpg", "🟢Jonas Wagner (On) ","11054 Gespräche","♌️ Jungfrau  ", "🏙️ Berlin (500 Km)" ,4,"2.9", "Hallo zusammen! Mein Ziel\nals Beziehungsexperte ist es,\nPaare dabei zu unterstützen, ihre \nBeziehung zu stärken, damit sie\ngemeinsam ein glückliches."),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            if (_showMoreItems)
              Container(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _buildMoreItems(),
                ),
              ),
          ],
        ),
      ),
    );
  }
  List<Widget> _buildMoreItems() {
    List<Widget> containers = [];
    isFavoriteList.add(false);
    containers.add(_buildBlackContainer("assets/Images/sascha.jpg", "🟢Sascha Heiy (On) ","52800 Gespräche", "♊️ Zwillinge","🏙️ Berlin (500 km)" ,0, "4.9","Hallo! Als Beziehungsexperte\nunterstütze ich Paare dabei, tiefe\nVerbindungen zu schaffen und\ngemeinsam die Höhen und Tiefen\ndes Lebens zu meistern."));
    containers.add(_buildBlackContainer("assets/Images/omi.jpg", "🔴Ihre Omi (Off) ", "15000 Gespräche","♏ Skorpion ","🏙️ Bassel (350 km)" ,1,"5.0","Herzlich willkommen! In meiner\nRolle als Beziehungsexperte\narbeite ich daran, Liebe und Ver-\nständnis zu fördern."));
    containers.add(_buildBlackContainer("assets/Images/marc.jpg", "🟡Calixte Man (Off) ", "14500 Gespräche","♊️ Zwillinge", "🏙️ Mainz (100 km)",2,"3.8", "Guten Tag! Als erfahrener Bezie-\nhungsexperte begleite ich Paare\nauf dem Weg zu einer gesunden,\nrespektvollen und erfüllenden\nPartnerschaft."));
    containers.add(_buildBlackContainer("assets/Images/alex.jpg", "🔴Tom König (Off)", "50230 Gespräche","♍ Jungfrau ","🏙️ Essen (610 km)" ,3,"3.5", "Grüße! Mit meinem Fachwissen\n alsBeziehungsexperte helfe ich\nPaaren, Konflikte zu lösen, die\nLiebe zu vertiefen."));
    containers.add(_buildBlackContainer("assets/Images/van.jpg", "🟢Van Müller (On) ","11054 Gespräche","♌️ Jungfrau  ", "🏙️ Berlin (500 Km)" ,4,"2.9", "Hallo zusammen! Mein Ziel\nals Beziehungsexperte ist es,\nPaare dabei zu unterstützen, ihre \nBeziehung zu stärken, damit sie\ngemeinsam ein glückliches."));
    return containers;
  }


  Widget _buildBlackContainer(String imagePath, String text, String gespraech, String stern,String stadt, int index, String textrange, String description) {
    return Container(
      width: 200,
      height: 230,
      margin: EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFA7C4D4),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left:65,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text,
                style: GoogleFonts.robotoSerif(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            top: 17,
            right:20,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  textrange,
                style: GoogleFonts.robotoSerif(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            top:25,
            left: 75,
            child: RatingBar.builder(
              initialRating: ratings[index],
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 12,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                setState(() {
                  ratings[index] = value;
                });
              },
            ),
          ),
          Positioned(
            top: 35,
            right:21,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                gespraech,
                style: GoogleFonts.robotoSerif(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            top: 55,
            right:45,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                stern,
                style: GoogleFonts.robotoSerif(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            top: 75,
            right:15,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                stadt,
                style: GoogleFonts.robotoSerif(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                description,
                style: GoogleFonts.robotoSerif(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            bottom:3,
            left: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                decoration: BoxDecoration(
                color: Color(0xFFA7C4D4),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child:TextButton.icon(
                  onPressed: () {

                  },
                  icon: Icon(Icons.phone, color: Colors.black),
                  label: Text(
                    "Anrufen",
                    style: GoogleFonts.robotoSerif(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.brown[200],

                  ),
                ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom:3,
            right: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFA7C4D4),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child:TextButton.icon(
                    onPressed: () {

                    },
                    icon: Icon(Icons.sms, color: Colors.black),
                    label: Text(
                      "Chatten",
                      style: GoogleFonts.robotoSerif(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(Home_Screen());
}


