import 'package:flutter/material.dart';

class SocialPageView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SocialPageViewState();
  }

}

class SocialPageViewState extends State<SocialPageView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: const Text("Je suis dans la nouvelle page"),
    );
  }

}