import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/services/database_service.dart';
import 'package:messenger_clone/ui/search_page/search_page_view.dart';
import 'package:stacked/stacked.dart';

class ChatPageViewModel extends BaseViewModel {
  AppRouter _appRouter = locator<AppRouter>();

  List<bool> received = [true, false, false, true, false];
  List list = const [true, false, true, false, false, false];

  List<String> name = const ["David", "Leo", "Rkive", "Harley", "Guetta"];

  takeToUserChatPage({required String name,
      String imageUrl =
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"}) async {
    await _appRouter.navigate(UserChatPageRoute(name: name, imageUrl: imageUrl));
  }
  takeToBioPicPage() async {
   var response =  await DataBaseService().read(from: 'Users', fields: FirebaseAuth.instance.currentUser!.uid);
    log(response.toString());
  }

  takeToSearchPage(){
    _appRouter.navigate(const SearchPageRoute());
  }

  printData(){

  }

}
