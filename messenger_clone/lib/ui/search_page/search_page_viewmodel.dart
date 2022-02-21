import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/model/user_profile_model.dart';
import 'package:messenger_clone/services/database_service.dart';
import 'package:stacked/stacked.dart';

class SearchPageViewModel extends BaseViewModel{

  final _appRouter = locator<AppRouter>();
  List friends = [];
  String search = '';
  final _dataBaseService = DataBaseService();
  late UserProfile _userProfile;
  List<UserProfile> userTiles = [];
  late StreamController streamController;
  late Stream stream;

  initSearchPage() async {
    setBusy(true);
    streamController = StreamController();
    var res = await DataBaseService().read(from: "Users", greaterThan: false, fields: FirebaseAuth.instance.currentUser!.uid, where: "id");
    print(res[0].data().toString());
    _userProfile = UserProfile.fromJson(res[0].data());
    stream = streamController.stream;
    streamController.add('waiting');
    setBusy(false);
  }

  searchForUser() async {
    userTiles.clear();
    var data;
    notifyListeners();
    try{
      log(search.trim().isEmpty.toString());
      if(search.isNotEmpty){
        var response = await DataBaseService().read(from: "Users", fields: search.toLowerCase(), where: "queryName");
        response.forEach((e) => {
            data = UserProfile.fromJson(e.data()),
          userTiles.add(data),
          notifyListeners()
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

  updateUser(String id) async {
    var res = await DataBaseService().read(from: "Users", fields: id, where: "id", greaterThan: false);
    UserProfile user = UserProfile.fromJson(res[0].data());
    friends.add(user);
    print("starting with step 1");
    await DataBaseService().update(_userProfile.copyWith(friend: friends), collection: "Users", field: FirebaseAuth.instance.currentUser!.uid);
  }


  popPage() async {
    _appRouter.pop();
  }

}