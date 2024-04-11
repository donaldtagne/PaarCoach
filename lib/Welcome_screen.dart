import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Play_pause.dart';
import 'SignUp_screen.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 600,
              decoration: BoxDecoration(
                color: Color(0xffbfc4d4),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    child: Text(
                      'Get \nYour Ex\n Back',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoSerif(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              child: Text(
                'nehmen Sie sich bitte eine Minute Zeit zum Lesen/Anhören!',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSerif(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                PlayableText(),
                Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 6),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignScreen(fem:0.1, ffem:0.1)),
                      );
                    },
                    child: Text(
                      'Weiter >>>',
                      style: GoogleFonts.robotoSerif(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(1, 0, 1 , 0),
              height: 513 ,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 6,
                    right: 6,
                    bottom: 40,
                    child: Container(
                      width: 398 ,
                      height: 700 ,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          child: Container(
                            child: RichText(
                              textAlign: TextAlign.justify,
                              softWrap: true,
                              text: TextSpan(
                                style: GoogleFonts.robotoSerif (
                                  fontSize: 16,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Trennungen sind emotional herausfordernd, auch wenn sie der richtige Schritt sind. Der Schmerz des Verlusts, Unsicherheit und manchmal das Gefühl des Versagens begleiten sie. Fragen wie "Hätte ich etwas anders machen können?" tauchen auf. Trennungen sind das Ergebnis vieler Faktoren. Die Zeit danach ermöglicht Selbstreflexion und Wachstum. Trotz anfänglichem Schmerz finden viele einen Weg zur Verarbeitung und zum Lernen. Unterstützung durch Freunde, Familie oder professionelle Hilfe fördert den Heilungsprozess für einen positiven Blick in die Zukunft.Trennungen sind oft eine der emotional herausforderndsten Erfahrungen im Leben eines Menschen. Selbst wenn es der richtige Schritt für beide Parteien ist, können die nachwirkenden Emotionen intensiv und überwältigend sein. Es ist ein Ende, nicht nur einer Romanze, sondern auch eines gemeinsamen Lebensabschnitts, geteilter Erinnerungen und ineinandergreifender Zukunftspläne.\nDer Schmerz einer Trennung wird oft durch das Gefühl des Verlustes, der Unsicherheit und manchmal sogar des Versagens intensiviert. Fragen wie "Hätte ich etwas anders machen können?" oder "Warum hat es nicht funktioniert?" tauchen immer wieder auf. Es ist wichtig zu verstehen, dass Trennungen oft das Ergebnis vieler Faktoren sind und nicht unbedingt das Versagen einer einzelnen Person darstellen.\nDie Zeit nach einer Trennung kann auch eine Gelegenheit zur Selbstreflexion und zum Wachstum sein. Sie bietet die Möglichkeit, sich über eigene Wünsche, Bedürfnisse und Grenzen klar zu werden. Während der Schmerz anfangs überwältigend sein kann, finden viele mit der Zeit einen Weg, ihn zu verarbeiten und daraus zu lernen. Es ist wichtig, sich Unterstützung zu suchen, sei es durch Freunde, Familie oder professionelle Hilfe, um den Heilungsprozess zu fördern und in eine positive Zukunft zu blicken.',
                                  ),
                                  TextSpan(
                                    text: 'um den Heilungsprozess zu fördern und in eine positive Zukunft zu blicken.',
                                    style: GoogleFonts.robotoSerif (
                                      fontSize: 16 ,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Align(
                      child: SizedBox(
                        width: 400,
                        height: 60,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xffbfc4d4),
                            borderRadius: BorderRadius.only (
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
