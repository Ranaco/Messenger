import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class EmailLoginViewModel extends BaseViewModel{

  final _appRouter = locator<AppRouter>();
  String email = "";
  String password = "";
  bool showPass = true;
  final _authService = AuthenticationService();

  changeShowPass() {
    showPass = !showPass;
    notifyListeners();
  }
  takeToSignUpPage() async {
    await _appRouter.navigate(SignupRoute());
  }

  popPage() async {
    await _appRouter.pop();
  }

  takeToBaseView(GlobalKey<FormState> _key) async {
    if(_key.currentState!.validate()){
      _key.currentState!.save();
      await _authService.signIn(email, password);
    }
  }

}