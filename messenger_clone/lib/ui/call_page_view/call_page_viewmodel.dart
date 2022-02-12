import 'package:flutter/material.dart';
import 'package:messenger_clone/ui/call_page_view/all_call/all_call_view.dart';
import 'package:messenger_clone/ui/call_page_view/missed_call/missed_call_view.dart';
import 'package:stacked/stacked.dart';

class CallPageViewModel extends BaseViewModel{

  int whichPage = 0;

  late PageController pageController;
  late int currentIndex = 0;
  late List<Widget> pages =[];
  pageSwiped(int index){
      print(index);
      whichPage = index;
      pageController.nextPage(duration:
      Duration(milliseconds: 200), curve: Curves.bounceIn);
      notifyListeners();
  }

  initCallPage() {
    pageController = PageController(
      initialPage: whichPage,
      keepPage: true,
    );
    pages = [
      const AllCallView(),
      const MissedCallView(),
    ];
  }

}