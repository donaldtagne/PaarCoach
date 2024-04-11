import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Profile',
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSerif(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              InkWell(
                onTap: () => _getImage(ImageSource.camera),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null ? Icon(Icons.camera_alt, size: 40) : null,
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () => _getImage(ImageSource.gallery),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Bild auswählen',
                  style: GoogleFonts.robotoSerif(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 3),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  'Telefonnummer',
                  style: GoogleFonts.robotoSerif(
                      fontSize: 20
                  ),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'Email',
                  style: GoogleFonts.robotoSerif(
                      fontSize: 20
                  ),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text(
                  'Your Favourites',
                  style: GoogleFonts.robotoSerif(
                      fontSize: 20
                  ),),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text(
                  'Payment',
                  style: GoogleFonts.robotoSerif(
                      fontSize: 20
                  ),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(
                  'Tell Your Friends',
                  style: GoogleFonts.robotoSerif(
                      fontSize: 20
                  ),
                ),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: GoogleFonts.robotoSerif(
                      fontSize: 20
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
                      fontSize: 20
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

  }
}
