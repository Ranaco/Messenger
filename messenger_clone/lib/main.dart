import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.locator.dart';
import 'package:messenger_clone/app/app.router.dart';
import 'package:messenger_clone/app/constants.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/router.guards.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupSnackbarUi();
  runApp(const MyApp());
}

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: const Color(0xFF303030),
    textColor: Colors.white,
    messageColor: Colors.white,
    mainButtonTextColor: Colors.black,
    animationDuration: const Duration(seconds: 1),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _appRouter = locator<AppRouter>();
    return MaterialApp.router(
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        )
      ),
      title: "Messenger",
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routeInformationProvider: _appRouter.routeInfoProvider(),
    );
  }
}
