import 'package:auto_route/auto_route.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/services/authentication_service.dart';

class AuthGuard extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final currUser = locator<AuthenticationService>();
    if(currUser.isAuthenticated){
      resolver.next(true);
    }else {
      router.push(LoginPageRoute());
    }
  }
}

