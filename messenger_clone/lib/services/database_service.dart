import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';


@singleton
class DataBaseService {
  final client = FirebaseFirestore.instance;
  Future<void> create(dynamic data,
      {required String from, String successMessage ="Account registered!"}) async {
      try{
       var res = await client.collection(from).add(data is Map ? data : data.toJson()).then((value) async {
        data.docId = value.id;
        data.queryName = data.name.toLowerCase();
        log(data.toString());
         await update(data, collection: from, field: "field");
          locator<SnackbarService>().showSnackbar(message: successMessage);
        });
      } catch (err){
        log(err.toString());
        locator<SnackbarService>().showSnackbar(message: err.toString());
      }
  }


  Future read({required String from,
    String where = "id",
    String fields = "",
    }) async {
    var rep;
    var response = await client.collection(from).where(where, isGreaterThanOrEqualTo: fields).get().then((value) {
      rep =  value.docs;
    });
    return rep;
  }

  Future update(
      dynamic data,
      {required String collection,
        required String field,
  }) async {
    try{
      await client.collection(collection).doc(data.docId).update(data.toJson());
    }catch(err){
      log(err.toString());
    }
  }

  // PostgrestResponse _afterExecution(PostgrestResponse response,
  //     String? successMessage) {
  // }
}