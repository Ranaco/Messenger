import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key,
      required this.tileTitle,
      this.tileIcon = "assets/images/no_profile.jpg",
      this.description = "",
      this.isProfileTile = false})
      : super(key: key);

  final String tileTitle;
  final String? description;
  final String tileIcon;
  final bool isProfileTile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: GestureDetector(
        child: Container(
          height: isProfileTile ? 76 : 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(
            child: ListTile(
              leading: isProfileTile
                  ? ClipOval(
                      child: Image.network(
                          tileIcon.isEmpty ? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" : tileIcon),
                    )
                  : Image.asset(tileIcon),
              title: isProfileTile
                  ? Text(tileTitle,
                      style: TextStyle(fontSize: isProfileTile ? 18 : 16))
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: isProfileTile ? 0 : 10,
                            right: tileTitle == "Devices"
                                ? 210
                                : tileTitle == "Account"
                                    ? 210
                                    : tileTitle == "Chats"
                                        ? 225
                                        : tileTitle == "Notifications"
                                            ? 180
                                            : tileTitle ==
                                                    "Data and Storage Usage"
                                                ? 90
                                                : tileTitle == "Help"
                                                    ? 230
                                                    : tileTitle == "Tell a Friend" ? 175 : 140),
                        child: Text(
                          tileTitle,
                          style: TextStyle(fontSize: isProfileTile ? 18 : 16),
                        ),
                      ),
                    ),
              subtitle: isProfileTile ? Text(description ?? "") : SizedBox(),
              trailing: Padding(
                padding: EdgeInsets.only(bottom: isProfileTile ? 0 : 8.0),
                child: HeroIcon(
                  HeroIcons.forward_arrow,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
