import 'package:flutter/material.dart';
import 'package:first_project/Splash_screen.dart';

class HomeScreen extends StatelessWidget{

  const HomeScreen({Key? key} ): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(

        appBar: AppBar(

          actions: [

            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle settings action
                print('Settings button pressed');
              },
            ),
          ],

        ),
      body: Container(
        width: 400,


        child: ListView.separated(
          scrollDirection: Axis.vertical,

          separatorBuilder: (context, _)=> SizedBox(height: 20,),
          itemCount: 5,
          itemBuilder: (context, index) => buildCard(),
        ),

      ),



      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffbfdbfe),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black,),
              label:"Home",


          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications, color: Colors.black,),
              label:'Notification',


          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.group_add, color: Colors.black,),
              label:'Forum',

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black, ),
              label:'Profile',


          ),

        ],
      ),
    );

  }
}

Widget buildCard() => Container(
  width: 300,
  height: 250,
  color: Colors.blue,
  child: Column(
    children: [
      Image.asset("assets/Image/logo.png"),
      const SizedBox(height: 4,),
      Text(
        " Kommunikation",
        style:TextStyle(fontSize:24),
      )
    ],
  ),

);