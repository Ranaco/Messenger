import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/settings_page/settings_page_viewmodel.dart';
import 'package:messenger_clone/widgets/settings_tile/settings_tile.dart';
import 'package:stacked/stacked.dart';

class SettingsPageView extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final String? bio;
  const SettingsPageView({Key? key, required this.imageUrl, required this.name, this.bio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsPageViewModel>.reactive(
      viewModelBuilder: () => SettingsPageViewModel(),
      builder: (context, model, child){
        return Scaffold(
          backgroundColor: AppStyle.primaryColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppStyle.appBarColor,
            toolbarHeight: 70,
            title: const Text("Settings", style: TextStyle(color: Colors.black),),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              GestureDetector(
                  onTap: (){
                    model.takeToProfilePage();
                  },
                  child:  SettingsTile(tileTitle: name, isProfileTile: true,description: bio == null ? "" : bio, tileIcon: imageUrl ?? "",)),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: (){
                  model.takeToStarredMessages();
                },
                child: const SettingsTile(tileTitle: "Starred Messages", tileIcon: "assets/images/starred.png",),
              ),
              GestureDetector(
                child: const SettingsTile(tileTitle: "Devices", tileIcon: "assets/images/device.png",),
              ),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: (){
                  log(imageUrl ?? "");
                },
                child: const SettingsTile(tileTitle: "Account", tileIcon: "assets/images/account.png",),
              ),
              GestureDetector(
                child: const SettingsTile(tileTitle: "Chats", tileIcon: "assets/images/chat.png",),
              ),
              GestureDetector(
                child: const SettingsTile(tileTitle: "Notifications", tileIcon: "assets/images/notification.png",),
              ),
              GestureDetector(
                child: const SettingsTile(tileTitle: "Data and Storage Usage", tileIcon: "assets/images/data.png",),
              ),
              const SizedBox(
                height: 35,
              ),
              GestureDetector(
                child: const SettingsTile(tileTitle: "Help", tileIcon: "assets/images/help.png",),
              ),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const CustomBottomSheet()
                  );
                },
                child: const SettingsTile(tileTitle: "Tell a Friend", tileIcon: "assets/images/tell_a_friend.png",),
              )
            ],
          )
        );
      },
    );
  }
}

class CustomBottomSheet extends StatelessWidget{
  const CustomBottomSheet({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){

      return SizedBox(
        height: 320,
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppStyle.lightBlue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                ),
                width: 350,
                height: 70,
                child: const Center(
                  child: Text('Email', style: TextStyle(color: Colors.blue, fontSize: 20),),
                ),
              ),
            ),
            Container(
              height: 2,
              width: 350,
              color: Colors.blue.shade100,
            ),
            GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppStyle.lightBlue,
                ),
                width: 350,
                height: 70,
                child: const Center(
                  child:  Text("SMS", style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20
                  ),),
                ),
              ),
            ),
            Container(
              height: 2,
              width: 350,
              color: Colors.blue.shade100,
            ),
            GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppStyle.lightBlue,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                height: 70,
                width: 350,
                child: const Center(
                  child: Text("Link", style: TextStyle(color: Colors.blue, fontSize: 20),),
                ),
              ),
            ),
            const  SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
    },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 70,
                width: 350,
                child: const Center(
                  child: Text("Cancel", style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),),
                ),
              ),
            )
          ],
        ),
      );
  }
}