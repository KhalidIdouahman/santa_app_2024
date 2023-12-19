import 'package:flutter/material.dart';
import 'package:santa_app_2024/constants/text.dart';
import 'package:santa_app_2024/functionalities/fetching_data.dart';
import 'package:santa_app_2024/models/chat_models/user_chat.dart';
import 'package:santa_app_2024/pages/calling_page/making_call_page.dart';

// i need to search on this to understand it will .
typedef CallbackAction = void Function();

class OtherCharactersPage extends StatelessWidget {
  const OtherCharactersPage({super.key});

  final serverUrl = "put url server here";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getCharactersList(urlApi: serverUrl),
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

            final List<UserChat> charactersList = snapshot.data!;

            return Padding(
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
            );
          }),
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
