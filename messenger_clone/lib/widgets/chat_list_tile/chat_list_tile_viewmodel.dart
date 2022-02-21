import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';

class ChatListTileViewModel extends BaseViewModel {
  final _appRouter = locator<AppRouter>();
  takeToUserChatPage(String name,
      {String? imageUrl}) {
    _appRouter.navigate(UserChatPageRoute(name: name, imageUrl: imageUrl));
  }
}
