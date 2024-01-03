// ignore_for_file: invalid_return_type_for_catch_error, body_might_complete_normally_catch_error, argument_type_not_assignable_to_error_handler

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:santa_app_2024/constants/firebase_str.dart';
import 'package:santa_app_2024/models/firestore_model/firestore_model.dart';

import 'dart:developer';

class MyFireStoreFunctionalities {
  // to point on the firestore db
  final _db = FirebaseFirestore.instance;

  Future<void> addCharacter(Character character) async {
    // to point on the collection
    final collectionRef = _db.collection(collectionName);
    // convert the character to a map to pass it to the add func.
    await collectionRef
        .add(characterObjToMap(character))
        .whenComplete(() => log("user added successfuly"))
        .catchError(
      (error) {
        log("user not added , something went wrong");
        log("this is the error : ${error.toString()}");
      },
    );
  }

  Future<List<Character>> fetchAllCharacters() async {
    // point to the characters collection
    final snapshotData = await _db
        .collection(collectionName)
        .get()
        .whenComplete(() => log("data fetched succesfuly"))
        .catchError(() => log("data not fetched , something went wrong"));
    // get the docs and map over them and return a list of characters.
    final charactersList = snapshotData.docs
        .map((data) => Character.dataFromFirestore(data))
        .toList();
    return charactersList;
  }

  Future<void> updateCharacter(Character character) async {
    // point to the characters collection , get the character id that will be changed in the db, and change
    // his value.
    await _db
        .collection(collectionName)
        .doc(character.id)
        .update(characterObjToMap(character))
        .whenComplete(() => log("data updated succesfuly"))
        .catchError(() => log("data not updated , something went wrong"));
  }

  characterObjToMap(Character character) {
    // i fill the map with the keys of firestore fields , and the values of the character obj
    return {
      firestoreCharacterName: character.characterName,
      firestoreCharacterPhone: character.characterNum,
      firestoreCharacterImg: character.characterImg,
      firestoreCharacterAudio: character.characterAudio,
      firestoreCharacterVideo: character.characterVideo,
    };
  }
}
