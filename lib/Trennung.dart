import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Schluss.dart';

class TrennungPage extends StatefulWidget {
  @override
  _TrennungPageState createState() => _TrennungPageState();
}

class _TrennungPageState extends State<TrennungPage> {
  int selectedAge = -1;

  void navigateToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SchlussPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ex zurückgewinnen',
          style: GoogleFonts.robotoSerif(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey,
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(
              onTap: navigateToNextPage,
              child: Text(
                'Warum ist es zur Trennung gekommen?',
                style: GoogleFonts.robotoSerif(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                  title: InkWell(
                    onTap: navigateToNextPage,
                    child: Text(
                      'Alltagsstress',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  value: 0,
                  groupValue: selectedAge,
                  onChanged: (value) {
                    setState(() {
                      selectedAge = value as int;
                    });
                    navigateToNextPage();
                  },
                  activeColor: Colors.black,
                ),
                RadioListTile(
                  title: InkWell(
                    onTap: navigateToNextPage,
                    child: Text(
                      'Mein ex hat keine Gefühle',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  value: 1,
                  groupValue: selectedAge,
                  onChanged: (value) {
                    setState(() {
                      selectedAge = value as int;
                    });
                    navigateToNextPage();
                  },
                  activeColor: Colors.black,
                ),
                RadioListTile(
                  title: InkWell(
                    onTap: navigateToNextPage,
                    child: Text(
                      'Kommunikationsprobleme',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  value: 2,
                  groupValue: selectedAge,
                  onChanged: (value) {
                    setState(() {
                      selectedAge = value as int;
                    });
                    navigateToNextPage();
                  },
                  activeColor: Colors.black,
                ),
                RadioListTile(
                  title: InkWell(
                    onTap: navigateToNextPage,
                    child: Text(
                      'Sexualität',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  value: 3,
                  groupValue: selectedAge,
                  onChanged: (value) {
                    setState(() {
                      selectedAge = value as int;
                    });
                    navigateToNextPage();
                  },
                  activeColor: Colors.black,
                ),
                RadioListTile(
                  title: InkWell(
                    onTap: navigateToNextPage,
                    child: Text(
                      'Sonstiges',
                      style: GoogleFonts.robotoSerif(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  value: 4,
                  groupValue: selectedAge,
                  onChanged: (value) {
                    setState(() {
                      selectedAge = value as int;
                    });
                    navigateToNextPage();
                  },
                  activeColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
