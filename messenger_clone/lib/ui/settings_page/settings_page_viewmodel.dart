import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';

class SettingsPageViewModel extends BaseViewModel{

  final _appRouter = locator<AppRouter>();
  String _userName = "Shadab";
  String get userName => _userName;
  takeToProfilePage() async {
    await _appRouter.navigate(ProfileRoute());
  }
  takeToStarredMessages() async {
    await _appRouter.navigate(StarredMessagesRoute());
  }
  
  popPage(){
    _appRouter.pop();
  }

}