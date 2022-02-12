import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'dart:developer';

import 'package:messenger_clone/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StorageService{

  final fireBaseStorageInstance = FirebaseStorage.instance;

  Future<String> upload({required File imageFile}) async {
    String downUrl = "";
  try{
    var snapShot = await fireBaseStorageInstance.ref().child('image/imageName').putFile(imageFile);
    downUrl = await snapShot.ref.getDownloadURL();
  } on FirebaseException catch(err){
    log(err.message.toString());
    locator<SnackbarService>().showSnackbar(message: err.message.toString());
    throw err.message.toString();
    }
    log(downUrl + "Downulr");
    return downUrl;
  }
}