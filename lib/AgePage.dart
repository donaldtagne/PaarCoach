import 'package:first_project/Gender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgePage extends StatefulWidget {
  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  int selectedAge = -1;

  void navigateToNextPage() {
     Navigator.push(context, MaterialPageRoute(builder: (context) => GenderPage()));
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
      body: SingleChildScrollView(
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Der Test dauert weniger als 5 Minuten\nErgebnisse folgen sofort.',
                  style: GoogleFonts.robotoSerif(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Starte direkt mit der ersten Frage und\ntriff eine Auswahl:',
                  style: GoogleFonts.robotoSerif(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(
              onTap: navigateToNextPage,
              child: Text(
                'Wie alt bist du?',
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
                      'Unter 18 Jahre',
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
                      'Über 18 Jahre',
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
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}
