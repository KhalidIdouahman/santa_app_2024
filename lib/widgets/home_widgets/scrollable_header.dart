// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:santa_app_2024/constants/colors.dart';

// typedef CallbackAction = void Function();

// i let this file because it contains all the codes that i have tried to make the header responsing so , maybe if i want 
// to develop the way his animating i would see this tryies .

// class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final double minHeight;
//   final double maxHeight;
//   final CallbackAction onSettingsClicked;
//   final CallbackAction onFavoriteClicked;

//   MyHeaderDelegate({
//     required this.minHeight,
//     required this.maxHeight,
//     required this.onSettingsClicked,
//     required this.onFavoriteClicked,
//   });

//   final double shrunkImageHeight = 60; // Define desired size for shrunk image
//   final double shrunkTextHeight = 15; // Define desired size for shrunk text

//   @override
//   double get minExtent => minHeight;

//   @override
//   double get maxExtent => maxHeight;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final size = MediaQuery.of(context).size;
//     final percent = (shrinkOffset / (maxHeight - minHeight));

//     // Calculate the current height of the header based on the scroll offset
//     final currentHeight = lerpDouble(maxHeight, minHeight, percent)!;

//     return Container(
//       width: double.infinity,
//       height: currentHeight,
//       // padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gredientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//       ),
//       child: Stack(
//         children: buildHeaderContent(
//             context, percent, size, onSettingsClicked, onFavoriteClicked),
//       ),
//     );
//   }

//   List<Widget> buildHeaderContent(
//       BuildContext context,
//       double percent,
//       Size size,
//       CallbackAction onSettingsClicked,
//       CallbackAction onFavoriteClicked) {
//     final imageHeight =
//         lerpDouble(size.height * 0.11, shrunkImageHeight, percent);
//     final imageWidth =
//         lerpDouble(size.height * 0.15, shrunkImageHeight, percent);

//     final textHeight = lerpDouble(15, shrunkTextHeight, percent);

//     // Position the settings and favorite buttons based on the scroll offset
//     // final settingsButtonPosition =
//     //     lerpDouble(size.width - 40, size.width * 0.85, percent);
//     // final favoriteButtonPosition =
//     //     lerpDouble(size.width - 80, size.width * 0.75, percent);

//     return [
//       Positioned(
//         top: 50,
//         left: 20,
//         child: InkWell(
//           onTap: onSettingsClicked,
//           child: CircleAvatar(
//             radius: 18,
//             backgroundColor: Colors.grey[350],
//             child: const Icon(
//               Icons.settings,
//               color: Colors.black,
//               size: 18,
//             ),
//           ),
//         ),
//       ),
//       Positioned(
//         top: 50,
//         right: 20,
//         child: InkWell(
//           onTap: onFavoriteClicked,
//           child: CircleAvatar(
//             radius: 18,
//             backgroundColor: Colors.grey[350],
//             child: const Icon(
//               Icons.favorite,
//               color: Colors.red,
//               size: 18,
//             ),
//           ),
//         ),
//       ),
//       Positioned(
//         top: imageHeight,
//         left: imageWidth,
//         // left: 130,
//         child: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           radius: imageHeight! / 2,
//           child: ClipOval(
//             child: Image.asset(
//               "assets/images/santa_calling.jpg",
//               height: imageHeight,
//               width: imageHeight,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: imageHeight + textHeight! - 40,
//         right: 100,
//         child: Text(
//           "Santa Claus",
//           style: TextStyle(
//             fontSize: lerpDouble(25, shrunkTextHeight, percent),
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: imageHeight - textHeight / 2 - 50,
//         right: 110,
//         child: Text(
//           "Call Puppet!",
//           style: TextStyle(
//             fontSize: lerpDouble(21, shrunkTextHeight, percent),
//             color: Colors.white,
//           ),
//         ),
//       ),
//     ];
//   }

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true; // Rebuild the header whenever the scroll offset changes
//   }
// }


// class MyHeaderDelegate extends StatelessWidget {
//   final CallbackAction onSettingsClicked;
//   final CallbackAction onFavoriteClicked;

//   MyHeaderDelegate({
//     required this.onSettingsClicked,
//     required this.onFavoriteClicked,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gredientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 50,
//             left: 20,
//             child: InkWell(
//               onTap: onSettingsClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.settings,
//                   color: Colors.black,
//                   size: 18,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 50,
//             right: 20,
//             child: InkWell(
//               onTap: onFavoriteClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                   size: 18,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 150, // Adjust this value as needed
//             left: 20,
//             child: CircleAvatar(
//               backgroundColor: Colors.transparent,
//               radius: 60,
//               child: ClipOval(
//                 child: Image.asset(
//                   "assets/images/santa_calling.jpg",
//                   height: 120,
//                   width: 120,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   "Santa Claus",
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   "Call Puppet!",
//                   style: TextStyle(
//                     fontSize: 21,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// } 




// third try

// class MyHeaderDelegate extends StatelessWidget {
//   final CallbackAction onSettingsClicked;
//   final CallbackAction onFavoriteClicked;

//   MyHeaderDelegate({
//     required this.onSettingsClicked,
//     required this.onFavoriteClicked,
//   });

//     // final percent = (shrinkOffset / (maxHeight - minHeight));

//     // // Calculate the current height of the header based on the scroll offset
//     // final currentHeight = lerpDouble(maxHeight, minHeight, percent)!;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gredientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 50,
//             left: 20,
//             child: InkWell(
//               onTap: onSettingsClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.settings,
//                   color: Colors.black,
//                   size: 18,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 50,
//             right: 20,
//             child: InkWell(
//               onTap: onFavoriteClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                   size: 18,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             // top: 180, // Adjust this value as needed
//             // left: 90,
//             top: 1,
//             left: 90,
//             child:  
//         const Row(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//         CircleAvatar(
//             backgroundColor: Colors.transparent,
//             radius: 30,
//             backgroundImage: AssetImage("assets/images/santa_calling.jpg"),
//             ),
        
//         const SizedBox(width: 10),
//             Column(
//               children: [
        
//         const Text(
//           "Santa Claus",
//           style: TextStyle(
//               fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Call Puppet!",
//           style: TextStyle(fontSize: 16, color: Colors.white),
//         ),
//               ],
//             )
//           ],
//         )
//                      ),


//         ],
//       ),
//     );
//   }
// } 



// //  a lot of tries to get to the right solution alhamdolilah .



// Widget headerBg(BuildContext context) {
//   return Container(
//       width: double.infinity,
//       // height: MediaQuery.of(context).size.height * 0.35,
//       padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: gredientColors,
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: const BorderRadius.only(
//             bottomLeft: Radius.circular(40),
//             bottomRight: Radius.circular(40),
//           )));
// }

// Widget headerTitle() {
//   return Row(
//     // mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       CircleAvatar(
//         backgroundColor: Colors.transparent,
//         radius: 30,
//         backgroundImage: AssetImage("assets/images/santa_calling.jpg"),
//       ),
//       SizedBox(width: 10),
//       Column(
//         children: [
//           Text(
//             "Santa Claus",
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           SizedBox(height: 10),
//           Text(
//             "Call Puppet!",
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//         ],
//       )
//     ],
//   );
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   static final UserChat userChat = usersList.first;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // again i wrapped the body with the builder widget , to work with it's context to open the sidebar ,
//       // because he needs a context inside the scaffold widget.
//       // to show the sidebar
//       drawer: const NavBar(),
//       body: Builder(builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               buildHeader(context, onSettingsClicked: () {
//                 Scaffold.of(context).openDrawer();
//               }, onFavoriteClicked: () {
//                 print("favorite clicked");
//               }),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: homeItemsData.length,
//                   itemBuilder: (context, index) {
//                     return buildHomeItem(
//                       gredientColor: homeItemsData[index].color,
//                       icon: homeItemsData[index].icon,
//                       title: homeItemsData[index].title,
//                       subtitle: homeItemsData[index].subtitle,
//                       onItemClicked: () {
//                         selectedItem(context, index);
//                         // just for debug
//                         print(index);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// // this let the taps work .
// typedef CallbackAction = void Function();

// Widget buildHeader(BuildContext context,
//     {required CallbackAction onSettingsClicked,
//     required CallbackAction onFavoriteClicked}) {

//   return Container(
//     width: double.infinity,
//     height: MediaQuery.of(context).size.height * 0.35,
//     padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
//     decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: gredientColors,
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         )),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // settings button
//             InkWell(
//               onTap: onSettingsClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.settings,
//                   color: Colors.black,
//                   size: 18,
//                 ),
//               ),
//             ),
//             // favorite button
//             InkWell(
//               onTap: onFavoriteClicked,
//               child: CircleAvatar(
//                 radius: 18,
//                 backgroundColor: Colors.grey[350],
//                 child: const Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                   size: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 100.0),
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//           CircleAvatar(
//               backgroundColor: Colors.transparent,
//               radius: 30,
//               backgroundImage: AssetImage("assets/images/santa_calling.jpg"),
//               ),

//           const SizedBox(width: 10),
//               Column(
//                 children: [

//           const Text(
//             "Santa Claus",
//             style: TextStyle(
//                 fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Call Puppet!",
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   );
// }





// import 'package:sliver_tools/sliver_tools.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   static final UserChat userChat = usersList.first;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // again i wrapped the body with the builder widget , to work with it's context to open the sidebar ,
//       // because he needs a context inside the scaffold widget.
//       // to show the sidebar
//       drawer: const NavBar(),
//       body: Builder(builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               buildHeader(context, onSettingsClicked: () {
//                 Scaffold.of(context).openDrawer();
//               }, onFavoriteClicked: () {
//                 print("favorite clicked");
//               }),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: homeItemsData.length,
//                   itemBuilder: (context, index) {
//                     return buildHomeItem(
//                       gredientColor: homeItemsData[index].color,
//                       icon: homeItemsData[index].icon,
//                       title: homeItemsData[index].title,
//                       subtitle: homeItemsData[index].subtitle,
//                       onItemClicked: () {
//                         selectedItem(context, index);
//                         // just for debug
//                         print(index);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//   static final UserChat userChat = usersList.first;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // again i wrapped the body with the builder widget , to work with it's context to open the sidebar ,
//       // because he needs a context inside the scaffold widget.
//       // to show the sidebar
//       drawer: const NavBar(),
//       body: Builder(builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: CustomScrollView(
//             slivers: [
//               // SliverPersistentHeader(
//               //   pinned: true, // Keep the header visible when scrolling
//               //   delegate: MyHeaderDelegate(
//               //     minHeight: MediaQuery.of(context).size.height * 0.15,
//               //     maxHeight: MediaQuery.of(context).size.height * 0.35,
//               //     onSettingsClicked: () {
//               //       Scaffold.of(context).openDrawer();
//               //     },
//               //     onFavoriteClicked: () {
//               //       print("favorite icon clicked.");
//               //     },
//               //   ),
//               // ),
//               SliverAppBar(
//                 expandedHeight: MediaQuery.of(context).size.height * 0.35,
//                 pinned: true, // Keep the header visible when scrolling
//                 floating: false,
//                 flexibleSpace: MyHeaderDelegate(
//                   onSettingsClicked: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                   onFavoriteClicked: () {
//                     print("favorite icon clicked.");
//                   },
//                 ),

//               ),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   (context, index) => buildHomeItem(
//                     gredientColor: homeItemsData[index].color,
//                     icon: homeItemsData[index].icon,
//                     title: homeItemsData[index].title,
//                     subtitle: homeItemsData[index].subtitle,
//                     onItemClicked: () {
//                       selectedItem(context, index);
//                       // just for debug
//                       print(index);
//                     },
//                   ),
//                   childCount: homeItemsData.length,
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
