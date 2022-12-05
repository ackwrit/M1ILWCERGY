import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/controller/AllFirebase_View.dart';
import 'package:untitled/controller/MapsController.dart';
import 'package:untitled/controller/MapsViewController.dart';
import 'package:untitled/controller/MyDrawer.dart';
import 'package:untitled/services/constants.dart';

class DashboardView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashboardViewState();
  }

}

class DashboardViewState extends State<DashboardView>{
  //variable
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height,
        child: MyDrawer(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: bodyPage(pageIndex),
      backgroundColor: Colors.purple,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value){
          setState(() {
            pageIndex = value;
          });

        },

        items: const [

          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.facebook),
            label: "Facebook"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.map),
              label: "Google"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.amazon),
              label: "amazon"
          ),

        ],
      ),
    );
  }


  Widget bodyPage(int pageChoix) {
    switch(pageChoix){
      case 0 : return Center(child: AllFirebaseView());

    case 1 : return MapsViewController();

    case 2 : return Center(child: Text("Ma 3eme page"));

      default : return Center(child: Text("Aucune page"));


    }
  }

}