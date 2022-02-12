import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/services/authentication_service.dart';
import 'package:messenger_clone/services/image_picker_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel{
  final _appRouter = locator<AppRouter>();
  File? imageFile;
  final _authService = locator<AuthenticationService>();
  popPage()async{
    await _appRouter.pop();
  }

  changePic(ImageSource source) async {
      imageFile = await ImagePickerService().getImage(source);
      notifyListeners();
  }

  logOut() async {
    await AuthenticationService().signOut();
  }
}