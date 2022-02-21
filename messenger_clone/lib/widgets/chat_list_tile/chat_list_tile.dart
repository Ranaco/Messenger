import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/chat_list_tile/chat_list_tile_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:intl/intl.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.name,
    this.date,
    this.received = false,
    this.lastChat,
    this.userImage,
    this.seen = false,
    Key? key,
  }) : super(key: key);

  final String name;
  final String? lastChat;
  final String? userImage;
  final bool received;
  final bool seen;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    String formattedDate = date != null ?DateFormat("dd/MM/yy").format(date!): "";

    return ViewModelBuilder<ChatListTileViewModel>.reactive(viewModelBuilder: () => ChatListTileViewModel(), builder: (context, model, child){
      return GestureDetector(
        onTap: (){
          model.takeToUserChatPage(name, imageUrl: userImage!);
        },
        child: Dismissible(
          background: Row(
            children: [
              const SizedBox(
                width: 230,
              ),
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(color: Colors.grey),
                child: GestureDetector(
                  onTap: () {
                    print("More tapped");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: HeroIcon(
                          HeroIcons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "More",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 90,
                decoration: const BoxDecoration(
                  color: Color(0xff3E70A7),
                ),
                child: GestureDetector(
                  onTap: () {
                    print("Archieve tapped");
                  },
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: HeroIcon(
                          HeroIcons.archive,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Archive",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          key: UniqueKey(),
          child: GestureDetector(
            onTap: () {
              print("$name Tapped");
            },
            child: Padding(
              padding: const EdgeInsets.only( bottom: 7),
              child: GestureDetector(
                onTap: (){
                 model.takeToUserChatPage(name);
                },
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    style: ListTileStyle.list,
                    leading: ClipOval(
                      child: userImage == null ? Image.asset('assets/images/no_profile.jpg') : Image.network(userImage!),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20)),
                        Text(formattedDate, style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        received
                            ? seen
                            ? const HeroIcon(
                          HeroIcons.double_tick,
                          color: Colors.blue,
                        )
                            : const HeroIcon(
                          HeroIcons.double_tick,
                          color: Colors.grey,
                        )
                            : const SizedBox(),
                        const SizedBox(
                        ),
                        Text(lastChat != null ?lastChat! : ""),
                      ],
                    ),
                    trailing: GestureDetector(
                        onTap: () {}, child: const HeroIcon(HeroIcons.forward_arrow)),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
