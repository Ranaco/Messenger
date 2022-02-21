import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/chat_page/user_chat_page/user_chat_page_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:messenger_clone/widgets/text_fields/empty_textField/empty_textField.dart';
import 'package:stacked/stacked.dart';

class UserChatPageView extends StatelessWidget {
  const UserChatPageView(
      {Key? key,
      required this.name,
       this.imageUrl,})
      : super(key: key);
  final String name;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {

    ScrollController _scrollController = ScrollController();

    autoScroll(){
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }

    return ViewModelBuilder<UserChatPageViewModel>.reactive(
      onModelReady: (model) => model.initChatPage(),
        onDispose: (model) {
        model.socket.disconnect();
        },
        viewModelBuilder: () =>
            UserChatPageViewModel(name: name, imageUrl: imageUrl),
        builder: (context, model, child) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => autoScroll());
          return Stack(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppStyle.appBarColor,
                  image: DecorationImage(
                    image: AssetImage("assets/backgrounds/rectangle.png",),
                    fit: BoxFit.fitWidth,
                  )
                ),
              ),
              SafeArea(
                child: Scaffold(
                  appBar: const CustomUserChatAppBar(
                    height: 70,
                  ),
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          controller: _scrollController,
                          itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                            child: model.chats[index]
                          );
          }, itemCount: model.chats.length,
                        ),
                      ),
                      const ChatTextField(),
                    ],
                  ),

                ),
              ),
            ],
          );
        });
  }
}

class ChatTextField extends ViewModelWidget<UserChatPageViewModel>{
  const ChatTextField({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context, UserChatPageViewModel viewModel){
    TextEditingController _textEditingController = TextEditingController();
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppStyle.appBarColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Stack(
        children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: IconButton(onPressed: (){
                log("Add tapped");
              },icon: const HeroIcon(HeroIcons.add, size: 25, color: Colors.blue,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 10),
              child:  EmptyTextField(hintText: "...",
                controller: _textEditingController,
                onChanged: (value){
                viewModel.msg = _textEditingController.text;
              }, suffixIcon: Padding(
                padding: const EdgeInsets.all(8.5),
                child: GestureDetector(
                  onTap: (){
                    viewModel.sendMessage();
                    _textEditingController.text = "";
                    viewModel.sendQuery();
                  },
                  child: const Icon(Icons.send, color: Colors.blue,),
                ),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 300,
                top: 15
              ),
              child: GestureDetector(
                onTap: (){},
                child: const HeroIcon(HeroIcons.camera, color: Colors.blue, size: 30,),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(
                left: 355,
                top: 18
            ),
            child: GestureDetector(
              onTap: (){},
              child: const HeroIcon(HeroIcons.mic, color: Colors.blue, size: 40,),
            ),
          )

        ],
      ),
    );
  }
}
class CustomUserChatAppBar extends ViewModelWidget<UserChatPageViewModel>
    with PreferredSizeWidget {
  const CustomUserChatAppBar({Key? key, required this.height})
      : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context, UserChatPageViewModel viewModel) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppStyle.appBarColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 8),
            child: IconButton(
              onPressed: viewModel.popPage,
              icon: HeroIcon(
                HeroIcons.backward_arrow,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, top: 6),
            child: SizedBox(
                width: 50,
                child: ClipOval(
                  child: viewModel.imageUrl == null ? Image.asset('assets/images/no_profile.jpg', height: 70, width: 70,) : Image.network(
                    viewModel.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130, top: 14),
            child: Text(
              viewModel.name,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130, top: 45),
            child: Text(
              "Click to view user info",
              style: TextStyle(
                color: Colors.grey.shade500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 285, top: 10),
            child: IconButton(
              onPressed: (){
                log("video call tapped");
                viewModel.printData();
              },
              icon: const HeroIcon(HeroIcons.call, color: Colors.blue, size: 40,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 340, top: 10),
              child: IconButton(
                onPressed: (){
                  log("call tapped");
                },
                icon: const  HeroIcon(HeroIcons.video_call, color: Colors.blue, size: 40,),
              ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
