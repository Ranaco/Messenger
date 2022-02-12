import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';
import 'starred_messages_viewmodel.dart';

class StarredMessagesView extends StatelessWidget {
  const StarredMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StarredMessagesViewModel>.reactive(
        viewModelBuilder: () => StarredMessagesViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              elevation: 0,
              backgroundColor: AppStyle.appBarColor,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: (){
                    model.popPage();
                  },
                  child:const HeroIcon(
                    HeroIcons.backward_arrow,
                    color: Colors.blue,
                  ),
                ),
              ),
              title: const Text("Starred Messages", style: TextStyle(color: Colors.black, fontSize: 20),),
              centerTitle: true,
              leadingWidth: 20,
            ),
          );
        });
  }
}
