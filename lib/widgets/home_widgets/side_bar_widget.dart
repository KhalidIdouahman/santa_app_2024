import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:santa_app_2024/constants/text.dart';
// import 'package:santa_app_2024/pages/home_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.red[400],
            padding: EdgeInsets.only(top: 24 + MediaQuery.of(context).padding.top , bottom: 24 ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 52,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/santa_calling.jpg',
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Santa Claus" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.white),)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return buildMenuItem(
                  index: index,
                  onClick: () => selectedItem(context, index),
                );
              },
              itemCount: sideBarData.length,
            ),
          ),
        ],
      ),

    );
  }

  Widget buildMenuItem({required int index, VoidCallback? onClick}) {
    const color = Colors.black87;
    // final hoverColor = Colors.grey[500];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(
          sideBarData[index].icon,
          color: color,
        ),
        title: Text(
          sideBarData[index].title,
          style: const TextStyle(color: color),
        ),
        subtitle: Text(
          sideBarData[index].subtitle,
          style: const TextStyle(color: color , fontSize: 12),
        ),
        onTap: onClick,
      ),
    );
  }

  void selectedItem(BuildContext myContext, int index) {
    // to close the sidebar each time we clicked on some item .
    Navigator.of(myContext).pop();
    switch (index) {
      case 0:
        // Navigator.pushReplacement(myContext,
        //     MaterialPageRoute(builder: (myContext) => const HomeScreen()));
        // print("sidebar item $index clicked.");
        break;
      case 1:
        // Navigator.push(myContext,
        //     MaterialPageRoute(builder: (myContext) => const TestPage()));
        // print("sidebar item $index clicked.");
        break;
      case 2:
        // Navigator.pushReplacement(myContext, MaterialPageRoute(builder: (myContext) => const HomePage()));
        // print("sidebar item $index clicked.");
        break;
      case -1:
        // this to exit the app
        SystemNavigator.pop();
        break;
    }
  }
}
