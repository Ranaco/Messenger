import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/model/user_profile_model.dart';
import 'package:messenger_clone/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SearchPageViewModel extends BaseViewModel{

  final _appRouter = locator<AppRouter>();
  String search = '';
  final _dataBaseService = DataBaseService();
  List userTiles = [];
  late StreamController streamController;
  late Stream stream;

  initSearchPage() async {
    setBusy(true);
    streamController = StreamController();
    stream = streamController.stream;
    streamController.add('waiting');
    setBusy(false);
  }

  searchForUser() async {
    userTiles.clear();
    notifyListeners();
    try{
      log(search.trim().isEmpty.toString());
      if(search.isNotEmpty){
        var response = await DataBaseService().read(from: "Users", fields: search.toLowerCase(), where: "queryName");
        response.forEach((e) => {
          userTiles.add(e.data()),
        });
        if(userTiles.isNotEmpty){
          streamController.add('done');
        } else {
          streamController.add('waiting');
        }
      }

      userTiles.forEach((element) {
        log(element.toString());
      });
    }catch(err){
      log(err.toString());
    }
  }

  popPage() async {
    _appRouter.pop();
  }

}