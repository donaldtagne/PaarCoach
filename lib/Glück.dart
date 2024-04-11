import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Zeit.dart';


class GluckPage extends StatefulWidget {
  @override
  _GluckPageState createState() => _GluckPageState();
}

class _GluckPageState extends State<GluckPage> {
  int selectedAge = -1;

  void navigateToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ZeitPage()));
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
                'Hat dein:e Ex dir in der Beziehung gesagt, dass er/sie glücklich mit dir ist?',
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
                      'Ja',
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
                      'Nein',
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
                      'Eher selten',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
