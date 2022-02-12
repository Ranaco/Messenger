import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/base_page/base_page_viewmodel.dart';
import 'package:messenger_clone/ui/call_page_view/call_page_view.dart';
import 'package:messenger_clone/ui/camera_page/camera_page_view.dart';
import 'package:messenger_clone/ui/chat_page/chat_page_view.dart';
import 'package:messenger_clone/ui/settings_page/settings_page_view.dart';
import 'package:messenger_clone/ui/status_page/status_page_view.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';

class BasePageView extends StatefulWidget {
  const BasePageView({Key? key}) : super(key: key);

  @override
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView> {

  late int currentIndex;

  late PageController _pageController;
  changePage(index){
   setState(() {
     currentIndex = index;
     _pageController.jumpToPage(currentIndex);
   });
  }

  @override
  void initState() {
    currentIndex = 3;
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BasePageViewModel>.reactive(
        viewModelBuilder: () => BasePageViewModel(),
        onModelReady: (model) => model.initBasePage(),
        builder: (context, model, child) {
          Widget CustomBottomNavigationBar(){
            return Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: AppStyle.appBarColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        changePage(0);
                      },
                      child:HeroIcon(HeroIcons.story, color: currentIndex == 0 ? Colors.blue : Colors.grey,),
                    ),
                    GestureDetector(
                      onTap: (){
                        changePage(1);
                      },
                      child:currentIndex == 1 ? const HeroIcon(HeroIcons.call_filled, color: Colors.blue,): const HeroIcon(HeroIcons.call, color: Colors.grey,),
                    ),
                    GestureDetector(
                      onTap: (){
                        changePage(2);
                      },
                      child: currentIndex == 2 ? const HeroIcon(HeroIcons.camera_filled, color: Colors.blue,) : const HeroIcon(HeroIcons.camera, color: Colors.grey,),
                    ),
                    GestureDetector(
                      onTap: (){
                        changePage(3);
                      },
                      child: currentIndex == 3 ? const HeroIcon(HeroIcons.chat_filled, color: Colors.blue,): const HeroIcon(HeroIcons.chat, color: Colors.grey,),
                    ),
                    GestureDetector(
                      onTap: (){
                        changePage(4);
                      },
                      child: currentIndex == 4 ? const HeroIcon(HeroIcons.settings_filled, color: Colors.blue,): const HeroIcon(HeroIcons.settings, color: Colors.grey,),
                    ),
                  ],
                )
            );
          }

          return
          model.isBusy ?
              const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ):
            Scaffold(
              body: PageView(
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                physics: const PageScrollPhysics(),
                controller: _pageController,
                children: model.pages,
              ),
              bottomNavigationBar: CustomBottomNavigationBar(),
            );
        });
  }



}

