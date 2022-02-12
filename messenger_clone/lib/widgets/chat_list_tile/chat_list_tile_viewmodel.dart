import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';

class ChatListTileViewModel extends BaseViewModel {
  final _appRouter = locator<AppRouter>();
  takeToUserChatPage(String name,
      {String imageUrl =
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"}) {
    _appRouter.navigate(UserChatPageRoute(name: name, imageUrl: imageUrl));
  }
}
