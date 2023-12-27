import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/calling_page/making_call_page.dart';

// import 'package:santa_app_2024/functionalities/fetching_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/banner_pusher.dart';

// i need to search on this to understand it will .
typedef CallbackAction = void Function();

class OtherCharactersPage extends StatefulWidget {
  const OtherCharactersPage({super.key});

  @override
  State<OtherCharactersPage> createState() => _OtherCharactersPageState();
}

class _OtherCharactersPageState extends State<OtherCharactersPage> {
  final serverUrl = "put url server here";
  final IronSourceBannerPusher bannerAd = IronSourceBannerPusher();

  @override
  void initState() {
    super.initState();
    // destroy the ironsource banner to let the space to show the admob native ads.
    IronSource.destroyBanner();
  }

  @override
  void dispose() {
    // initialize the banner ads to be showing in all pages.
    bannerAd.showBannerAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "Contacts",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            // it is neccessr to do this line , or the design wouldn't show.
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body:
          // FutureBuilder(
          //     future: getCharactersList(urlApi: serverUrl),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(child: CircularProgressIndicator.adaptive());
          //       }

          //       if (snapshot.hasError) {
          //         return Center(
          //             child: Text(
          //           snapshot.error.toString(),
          //           style:
          //               const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //         ));
          //       }

          //       final List<UserChat> charactersList = snapshot.data!;

          //       return
          Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  UserChat choosedUser = usersList[index];
                  return buildListItem(
                    user: choosedUser,
                    onItemClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MakeCallPage(user: choosedUser),
                          // this should be uncomented when the server is working.
                          // builder: (context) => MakeCallPage(user: charactersList[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const NativeAdWidget(
              maxWidth: 330, maxHeight: 360, adSize: TemplateType.medium),
        ],
      ),
      // }),
    );
  }
}

Widget buildListItem(
    {required UserChat user, required CallbackAction onItemClicked}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
    child: Card(
      child: InkWell(
        onTap: onItemClicked,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(user.imgUrl),
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.userName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    user.phoneNum!,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
              // const SizedBox(width: 0.1),
              const Icon(
                Icons.call,
                color: Colors.black,
                size: 22,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
