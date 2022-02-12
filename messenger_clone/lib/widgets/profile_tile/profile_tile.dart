import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppStyle.greenBlue,
        ),
        height: 120,
        width: 120,
    );
  }
}
