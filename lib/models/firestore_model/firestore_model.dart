import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:santa_app_2024/constants/firebase_str.dart';

class Character {
  final String? id;
  final String characterName;
  final String characterImg;
  final String characterNum;
  final String characterVideo;
  final String characterAudio;

  const Character({
    this.id,
    required this.characterName,
    required this.characterImg,
    required this.characterNum,
    required this.characterAudio,
    required this.characterVideo,
  });

  // to convert the fetched data from firestore document to this UserChat obj
  factory Character.dataFromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Character(
      id: document.id,
      characterName: data[firestoreCharacterName],
      characterImg: data[firestoreCharacterImg],
      characterNum: data[firestoreCharacterPhone],
      characterAudio: data[firestoreCharacterAudio],
      characterVideo: data[firestoreCharacterVideo],
    );
  }
}
