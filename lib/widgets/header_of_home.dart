import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/colors.dart';

Widget buildHeader(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.35,
    padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gredientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40),)
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[350],
              child: Icon(Icons.settings , color: Colors.black, size: 18,),
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[350],
              child: Icon(Icons.favorite , color: Colors.red, size: 18,),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50,
          child: ClipOval(
            child: Image.asset("assets/images/santa_calling.jpg" , height: 200 , width: 200 ,fit: BoxFit.cover,),
          )
        ),
        const SizedBox(height: 25),
        Text("Santa Claus" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold ,color: Colors.white),),
        const SizedBox(height: 10),
        Text("Call Puppet!" , style: TextStyle(fontSize: 18 , color: Colors.white),),
      ],
    ),
  );
}
