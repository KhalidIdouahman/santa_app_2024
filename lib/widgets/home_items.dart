import 'package:flutter/material.dart';

// i add this line to to make the onItemClicked work
typedef CallbackAction = void Function();

Widget buildHomeItem(
    {required IconData icon, required String title, required String subtitle ,
     required List<Color> gredientColor , required CallbackAction onItemClicked}) {

  return Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: gredientColor,
            begin: Alignment.topLeft,
            end: Alignment.topRight),
        borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      leading: Icon(icon, color:  Colors.white, size: 50),
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: onItemClicked,
      contentPadding: EdgeInsets.all(5),
    ),
  );
}

  // return Container(
  //   padding: EdgeInsets.all(5),
  //   decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //           colors: gredientColor1,
  //           begin: Alignment.topLeft,
  //           end: Alignment.topRight),
  //       borderRadius: BorderRadius.circular(20)),
  //   child: ListTile(
  //     leading: Icon(Icons.image, color: Colors.white, size: 50),
  //     title: Text(
  //       "Wallpapers",
  //       style: TextStyle(
  //           color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  //     ),
  //     subtitle: Text(
  //       "a lot of wallpapers to see.",
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     trailing: Icon(
  //       Icons.arrow_forward_ios,
  //       color: Colors.white,
  //     ),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     onTap: () {
  //       // Navigate to the chat screen
  //     },
  //     contentPadding: EdgeInsets.all(5),
  //   ),
  // );