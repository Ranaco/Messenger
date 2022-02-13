import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/model/user_profile_model.dart';
import 'package:messenger_clone/services/database_service.dart';
import 'package:messenger_clone/services/storage_service.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';
import '../../app/app.router.dart';
import '../../services/image_picker_service.dart';

class BioPicPageViewModel extends BaseViewModel{

  final _appRouter = locator<AppRouter>();
  final storageService = StorageService();
  late UserProfile userProfile;

  initBioPicPage() async {
    setBusy(true);
    var response = await DataBaseService().read(from: 'Users', fields: FirebaseAuth.instance.currentUser!.uid, where: "id");
    userProfile = UserProfile.fromJson(response.first.data());
    setBusy(false);
  }

  String bio = "Hello there!";
  File? imageFile;

  changePic(ImageSource source) async {
    imageFile = await ImagePickerService().getImage(source);
    notifyListeners();
  }

  uploadFile() async {
    if(imageFile != null){
      log('step 1');
    String imageUrl = await storageService.upload(imageFile: imageFile!);
    log(imageUrl + "imageUrl");
    log('step 2');
    DataBaseService().update(userProfile.copyWith(avatar_url: imageUrl, bio: bio), collection: "Users", field: userProfile.id, ).then((value) {
      locator<AppRouter>().navigate(const BasePageRoute());
    });
  }//`\_(>_<)_/`
    else if(imageFile == null){
      locator<AppRouter>().navigate(const BasePageRoute());
    }
  }

  popPage() async {
    _appRouter.pop();
  }

}