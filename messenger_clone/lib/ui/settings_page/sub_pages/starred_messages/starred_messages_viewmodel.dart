import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:stacked/stacked.dart';

class StarredMessagesViewModel extends BaseViewModel{
  final _appRouter = locator<AppRouter>();
  popPage() async {
    await _appRouter.pop();
  }
}