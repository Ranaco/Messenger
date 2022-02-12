import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:messenger_clone/app/router.guards.dart';
import 'package:messenger_clone/ui/base_page/base_page_view.dart';
import 'package:messenger_clone/ui/bio_pic_page/bio_pic_page_view.dart';
import 'package:messenger_clone/ui/camera_page/camera_page_view.dart';
import 'package:messenger_clone/ui/chat_page/chat_page_view.dart';
import 'package:messenger_clone/ui/chat_page/user_chat_page/user_chat_page_view.dart';
import 'package:messenger_clone/ui/login_page/email_login_page/email_login_view.dart';
import 'package:messenger_clone/ui/login_page/login_page_view.dart';
import 'package:messenger_clone/ui/search_page/search_page_view.dart';
import 'package:messenger_clone/ui/settings_page/settings_page_view.dart';
import 'package:messenger_clone/ui/settings_page/sub_pages/profile_view/profile_view.dart';
import 'package:messenger_clone/ui/settings_page/sub_pages/starred_messages/starred_messages_view.dart';
import 'package:messenger_clone/ui/sign_up_page/sign_up_page_view.dart';
import 'package:messenger_clone/ui/status_page/status_page_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../model/user_profile_model.dart';
part 'app.router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: "View,Route", routes: <AutoRoute>[
  AutoRoute(
    page: ChatPageView,
  ),
  AutoRoute(
    page: BasePageView,
    initial: true,
    guards: [AuthGuard]
  ),
  AutoRoute(
    page: SettingsPageView,
  ),
  AutoRoute(
    page: StatusPageView,
  ),
  AutoRoute(page: CameraPageView),
  AutoRoute(
    page: LoginPageView,
  ),
  AutoRoute(
    page: UserChatPageView,
  ),
  AutoRoute(page: StarredMessagesView),
  AutoRoute(
    page: ProfileView,
  ),
  AutoRoute(
    page: EmailLoginView,
  ),
  AutoRoute(
    page: SignupView,
  ),
  AutoRoute(
    page: SearchPageView,
  ),
  AutoRoute(
    page: BioPicPageView,
  )
])
@singleton
class AppRouter extends _$AppRouter {
  AppRouter()
      : super(
    authGuard: AuthGuard(),
    navigatorKey: StackedService.navigatorKey
  );
}
