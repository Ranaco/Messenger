import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/widgets/chat_list_tile/chat_list_tile.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';
import 'chat_page_viewmodel.dart';

class ChatPageView extends StatelessWidget {
  const ChatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatPageViewModel>.reactive(
        viewModelBuilder: () => ChatPageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppStyle.primaryColor,
              appBar: AppBar(
                toolbarHeight: 70,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        model.takeToSearchPage();
                      },
                      icon: const HeroIcon(
                        HeroIcons.search,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      model.takeToBioPicPage();
                      print("Edit tapped");
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ),
                centerTitle: true,
                title: const Text(
                  "Chats",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                backgroundColor: AppStyle.appBarColor,
                foregroundColor: AppStyle.appBarColor,
              ),
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 20),
                        child: GestureDetector(
                          onTap: () {
                            print("Broadcast Lists tapped");
                          },
                          child: const Text(
                            "Broadcast Lists",
                            style: TextStyle(color: Colors.blue, fontSize: 17),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("new group tapped");
                          },
                          child: const Text(
                            "New Group",
                            style: TextStyle(color: Colors.blue, fontSize: 17),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                        padding:const EdgeInsets.only(top: 10),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return CustomListTile(
                              date: DateTime.now(),
                              lastChat: "Hello Rana",
                              name: model.name[index],
                              received: model.received[index],
                              seen: model.list[index],
                            );
                          }))
                ],
              ));
        });
  }
}

