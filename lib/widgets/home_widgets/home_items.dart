import 'package:flutter/material.dart';

// i add this line to to make the onItemClicked work
typedef CallbackAction = void Function();

// i made these changes of adding the last icon to show the locked features to open them with ads .

Widget buildHomeItem(
    {required IconData firstIcon, required IconData lastIcon ,required String title, required String subtitle ,
     required List<Color> gredientColor , required CallbackAction onItemClicked}) {

  return Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: gredientColor,
            begin: Alignment.topLeft,
            end: Alignment.topRight),
        borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      leading: Icon(firstIcon, color:  Colors.white, size: 50),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: Icon(
        lastIcon,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: onItemClicked,
      contentPadding: const EdgeInsets.all(5),
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