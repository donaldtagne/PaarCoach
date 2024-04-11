import 'package:first_project/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int visibleItemCount = 5; 
  bool _showMoreItems = false;
  List<bool> isFavoriteList = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Communitys',
            style: GoogleFonts.robotoSerif(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Finde dein Community',
            style: GoogleFonts.robotoSerif(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            height: 100,
            child: Image.asset(
              'assets/Images/communitys.png',
              fit: BoxFit.cover,
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
                      'New Community',
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
                _buildBlackContainer("assets/Images/Ex.png", "Ex-Zurück-Teams 💔", "Du lernst durch Erfahrungen\nAnderer , wie du dein Ex\nzurückgewinnst.", 0),
                _buildBlackContainer("assets/Images/bindung.jpg", "Bindungsangst-Teams 🧩", "Du lernst durch Erfahrungen\nAnderer , wie du dein Ex\nzurückgewinnst.",1),
                _buildBlackContainer("assets/Images/selflove.png", "Selbstentwicklung 🌱💪", "Du lernst mit anderen, wie \nman auf sich aufpassen kann.",2),
                _buildBlackContainer("assets/Images/kummer.png", "Liebeskummer 😢💔", "Hier erfährst du mit Anderen ,\nwie du Liebeskummer\nloswerden kannst..",3),
                _buildBlackContainer("assets/Images/tipps.png", "Beziehungstipps 💑📚", "Du lernst durch Erfahrungen\nAnderer , wie du in einer\nBeziehung besser wirst.",4),
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
    containers.add(_buildBlackContainer("assets/Images/Ex.png", "LiebejoinCommunity 💑", "Du lernst durch Erfahrungen\nAnderer, wie du dein Ex\nzurückgewinnst.",5));
    containers.add(_buildBlackContainer("assets/Images/bindung.jpg", "HerzlichZusammen 💖", "Du lernst durch Erfahrungen\nAnderer, wie du dein Ex\nzurückgewinnst.",6));
    containers.add(_buildBlackContainer("assets/Images/selflove.png", "LiebeGemeinschaft 🌈", "Du lernst mit anderen, wie \nman auf sich aufpassen kann.",7));
    containers.add(_buildBlackContainer("assets/Images/kummer.png", "VerliebtImAustausch 💬", "Hier erfährst du mit Anderen, \nwie du Liebeskummer\nloswerden kannst.",8));
    containers.add(_buildBlackContainer("assets/Images/tipps.png", "HerzschlagNetzwerk 💓", "Du lernst durch Erfahrungen\nAnderer, wie du in einer\nBeziehung besser wirst.",9));

    return containers;
  }


  Widget _buildBlackContainer(String imagePath, String text, String description, int index) {
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
            width: 200,
            height: 115,
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
            top: 115,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text,
                style: GoogleFonts.robotoSerif(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            top: 135,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                description,
                style: GoogleFonts.robotoSerif(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Positioned(
            bottom: 2,
            right: 3,
            child: IconButton(
              icon: Icon(
                isFavoriteList[index]
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: isFavoriteList[index] ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  isFavoriteList[index] = !isFavoriteList[index];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}





