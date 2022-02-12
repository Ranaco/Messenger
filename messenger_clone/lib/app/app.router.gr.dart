// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    ChatPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ChatPageView());
    },
    BasePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BasePageView());
    },
    SettingsPageRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: SettingsPageView(
              key: args.key,
              imageUrl: args.imageUrl,
              name: args.name,
              bio: args.bio));
    },
    StatusPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StatusPageView());
    },
    CameraPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CameraPageView());
    },
    LoginPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPageView());
    },
    UserChatPageRoute.name: (routeData) {
      final args = routeData.argsAs<UserChatPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: UserChatPageView(
              key: args.key, name: args.name, imageUrl: args.imageUrl));
    },
    StarredMessagesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const StarredMessagesView());
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfileView());
    },
    EmailLoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmailLoginView());
    },
    SignupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignupView());
    },
    SearchPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SearchPageView());
    },
    BioPicPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const BioPicPageView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(ChatPageRoute.name, path: '/chat-page-view'),
        RouteConfig(BasePageRoute.name, path: '/', guards: [authGuard]),
        RouteConfig(SettingsPageRoute.name, path: '/settings-page-view'),
        RouteConfig(StatusPageRoute.name, path: '/status-page-view'),
        RouteConfig(CameraPageRoute.name, path: '/camera-page-view'),
        RouteConfig(LoginPageRoute.name, path: '/login-page-view'),
        RouteConfig(UserChatPageRoute.name, path: '/user-chat-page-view'),
        RouteConfig(StarredMessagesRoute.name, path: '/starred-messages-view'),
        RouteConfig(ProfileRoute.name, path: '/profile-view'),
        RouteConfig(EmailLoginRoute.name, path: '/email-login-view'),
        RouteConfig(SignupRoute.name, path: '/signup-view'),
        RouteConfig(SearchPageRoute.name, path: '/search-page-view'),
        RouteConfig(BioPicPageRoute.name, path: '/bio-pic-page-view')
      ];
}

/// generated route for
/// [ChatPageView]
class ChatPageRoute extends PageRouteInfo<void> {
  const ChatPageRoute() : super(ChatPageRoute.name, path: '/chat-page-view');

  static const String name = 'ChatPageRoute';
}

/// generated route for
/// [BasePageView]
class BasePageRoute extends PageRouteInfo<void> {
  const BasePageRoute() : super(BasePageRoute.name, path: '/');

  static const String name = 'BasePageRoute';
}

/// generated route for
/// [SettingsPageView]
class SettingsPageRoute extends PageRouteInfo<SettingsPageRouteArgs> {
  SettingsPageRoute(
      {Key? key, required String? imageUrl, required String name, String? bio})
      : super(SettingsPageRoute.name,
            path: '/settings-page-view',
            args: SettingsPageRouteArgs(
                key: key, imageUrl: imageUrl, name: name, bio: bio));

  static const String name = 'SettingsPageRoute';
}

class SettingsPageRouteArgs {
  const SettingsPageRouteArgs(
      {this.key, required this.imageUrl, required this.name, this.bio});

  final Key? key;

  final String? imageUrl;

  final String name;

  final String? bio;

  @override
  String toString() {
    return 'SettingsPageRouteArgs{key: $key, imageUrl: $imageUrl, name: $name, bio: $bio}';
  }
}

/// generated route for
/// [StatusPageView]
class StatusPageRoute extends PageRouteInfo<void> {
  const StatusPageRoute()
      : super(StatusPageRoute.name, path: '/status-page-view');

  static const String name = 'StatusPageRoute';
}

/// generated route for
/// [CameraPageView]
class CameraPageRoute extends PageRouteInfo<void> {
  const CameraPageRoute()
      : super(CameraPageRoute.name, path: '/camera-page-view');

  static const String name = 'CameraPageRoute';
}

/// generated route for
/// [LoginPageView]
class LoginPageRoute extends PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page-view');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [UserChatPageView]
class UserChatPageRoute extends PageRouteInfo<UserChatPageRouteArgs> {
  UserChatPageRoute({Key? key, required String name, required String imageUrl})
      : super(UserChatPageRoute.name,
            path: '/user-chat-page-view',
            args: UserChatPageRouteArgs(
                key: key, name: name, imageUrl: imageUrl));

  static const String name = 'UserChatPageRoute';
}

class UserChatPageRouteArgs {
  const UserChatPageRouteArgs(
      {this.key, required this.name, required this.imageUrl});

  final Key? key;

  final String name;

  final String imageUrl;

  @override
  String toString() {
    return 'UserChatPageRouteArgs{key: $key, name: $name, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [StarredMessagesView]
class StarredMessagesRoute extends PageRouteInfo<void> {
  const StarredMessagesRoute()
      : super(StarredMessagesRoute.name, path: '/starred-messages-view');

  static const String name = 'StarredMessagesRoute';
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '/profile-view');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [EmailLoginView]
class EmailLoginRoute extends PageRouteInfo<void> {
  const EmailLoginRoute()
      : super(EmailLoginRoute.name, path: '/email-login-view');

  static const String name = 'EmailLoginRoute';
}

/// generated route for
/// [SignupView]
class SignupRoute extends PageRouteInfo<void> {
  const SignupRoute() : super(SignupRoute.name, path: '/signup-view');

  static const String name = 'SignupRoute';
}

/// generated route for
/// [SearchPageView]
class SearchPageRoute extends PageRouteInfo<void> {
  const SearchPageRoute()
      : super(SearchPageRoute.name, path: '/search-page-view');

  static const String name = 'SearchPageRoute';
}

/// generated route for
/// [BioPicPageView]
class BioPicPageRoute extends PageRouteInfo<void> {
  const BioPicPageRoute()
      : super(BioPicPageRoute.name, path: '/bio-pic-page-view');

  static const String name = 'BioPicPageRoute';
}
