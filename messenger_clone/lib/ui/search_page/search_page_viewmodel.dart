import 'dart:async';
import 'dart:developer';

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
    log(search.trim().isEmpty.toString());
    if(search.isNotEmpty){
      var response = await Supabase.instance.client.from('Users').select().textSearch('name', search).execute();
      response.data.forEach((e) {
        UserProfile toAdd = UserProfile.fromJson(e);
        userTiles.add(toAdd);
        notifyListeners();
      });
    }
    log(userTiles.length.toString());
  }

  popPage() async {
    _appRouter.pop();
  }

}