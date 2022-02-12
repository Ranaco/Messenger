import 'package:flutter/cupertino.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class SignUpPageViewModel extends BaseViewModel{
  String email = "";
  String password = "";
  String confPassword = "";
  String name = "";
  bool showPass = true;
  bool showConfPass = true;
  final _appRouter = locator<AppRouter>();
  final _authService = AuthenticationService();
  changeShowPass() {
    showPass = !showPass;
    notifyListeners();
  }
  changeConfPass() {
    showConfPass = !showConfPass;
    notifyListeners();
  }

  takeToBasePage(GlobalKey<FormState> _key) async {
    if(_key.currentState!.validate())  {
      _key.currentState!.save();
      await _authService.signUp(email, password, name);
    }
  }
  popPage() async {
    await _appRouter.pop();
  }
}