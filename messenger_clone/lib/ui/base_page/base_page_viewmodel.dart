import 'package:flutter/material.dart';
import 'package:messenger_clone/services/database_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../model/user_profile_model.dart';
import '../call_page_view/call_page_view.dart';
import '../camera_page/camera_page_view.dart';
import '../chat_page/chat_page_view.dart';
import '../settings_page/settings_page_view.dart';
import '../status_page/status_page_view.dart';

class BasePageViewModel extends BaseViewModel{

  int currentIndex = 3;



  late List<Widget> _pages;

  List<Widget> get pages => _pages;


  final _dataBaseService = DataBaseService();


  Future<void> initBasePage() async {
    setBusy(true);
      _pages = [
        const StatusPageView(),
        const CallPageView(),
        const CameraPageView(),
        const ChatPageView(),
        const SettingsPageView(imageUrl: null, name: "rana", bio: "hello"),
      ];
    setBusy(false);
  }

}