import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/calling_page/making_call_page.dart';

// import 'package:santa_app_2024/functionalities/fetching_data.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:santa_app_2024/ads_services/ad_mob_ads/native_ads/home_native_ad.dart';
import 'package:santa_app_2024/ads_services/iron_source_ads/banner_pusher.dart';

import 'package:santa_app_2024/widgets/other_characters_widget/other_characters_item.dart';
import 'package:santa_app_2024/models/firestore_model/firestore_model.dart';
import 'package:santa_app_2024/functionalities/firebase_functionalities.dart';

// i need to search on this to understand it will .
typedef CallbackAction = void Function();

class OtherCharactersPage extends StatefulWidget {
  const OtherCharactersPage({super.key});

  @override
  State<OtherCharactersPage> createState() => _OtherCharactersPageState();
}

class _OtherCharactersPageState extends State<OtherCharactersPage> {
  // final serverUrl = "put url server here";
  final IronSourceBannerPusher bannerAd = IronSourceBannerPusher();

  // create an obj of the class where i handle the interaction with firestore to get the data.
  final firestoreData = MyFireStoreFunctionalities();

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
      body: FutureBuilder(
          future: firestoreData.fetchAllCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }

            if (snapshot.hasError) {
              return Center(
                  child: Text(
                snapshot.error.toString(),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ));
            }

            final List<Character> charactersList = snapshot.data!;

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      // itemCount: usersList.length,
                      itemCount: charactersList.length,
                      itemBuilder: (context, index) {
                        // i let this user to pass the data of santa to makeCall page.
                        UserChat choosedUser = usersList[0];
                        Character choosedCharacter = charactersList[index];
                        return buildCharacterListItem(
                          character: choosedCharacter,
                          onItemClicked: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MakeCallPage(user: choosedUser , character: choosedCharacter),
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
              // ),
            );
          }),
    );
  }
}
