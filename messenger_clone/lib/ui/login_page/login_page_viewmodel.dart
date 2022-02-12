import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';

class LoginPageViewModel extends BaseViewModel{
    final _appRouter = locator<AppRouter>();
    String number = "";
    bool? activeButton = false;
    activateButton(){
        if(number.length < 10){
            activeButton = false;
        } else{
            activeButton = true;
        }
        notifyListeners();
    }
    takeToEmailLoginPage() async {
        await _appRouter.navigate(const EmailLoginRoute());
    }
}