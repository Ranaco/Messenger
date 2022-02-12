
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/model/user_profile_model.dart';
import 'package:messenger_clone/services/database_service.dart';
import 'package:stacked_services/stacked_services.dart';

@singleton
class AuthenticationService {

  final firebase = FirebaseAuth.instance;

  bool get isAuthenticated => FirebaseAuth.instance.currentUser != null;

  Future<void> signIn(String email, String password) async {
   try{
     await firebase.signInWithEmailAndPassword(email: email, password: password).then((value) async {
       await locator<AppRouter>().replace(const BasePageRoute());
     });
   } on FirebaseAuthException catch(err){
      locator<SnackbarService>().showSnackbar(message: err.message!);
      log(err.message!);
   }
  }
  Future<void> signUp(String email, String password, String name) async {
   try{
     await firebase.createUserWithEmailAndPassword(email: email, password: password).then((value) {
       UserProfile userProfile = UserProfile(name: name, email: email, docId: "docId", id: value.user!.uid);
       DataBaseService().create(userProfile, from: "Users");
       firebase.signInWithEmailAndPassword(email: email, password: password).then((value) {
         locator<AppRouter>().replace(const BioPicPageRoute());
       });
     });
   }on FirebaseAuthException catch(err){
     locator<SnackbarService>().showSnackbar(message: err.message!);
     log(err.message!);
   }
  }
  Future<void> signOut() async {
    await firebase.signOut().then((value) {
      locator<AppRouter>().replace(const LoginPageRoute());
    });
  }
}