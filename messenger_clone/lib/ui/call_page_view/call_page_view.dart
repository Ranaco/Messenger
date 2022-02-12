import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/call_page_view/call_page_viewmodel.dart';
import 'package:messenger_clone/ui/call_page_view/missed_call/missed_call_view.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';

class CallPageView extends StatefulWidget {
  const CallPageView({Key? key}) : super(key: key);

  @override
  State<CallPageView> createState() => _CallPageViewState();
}

class _CallPageViewState extends State<CallPageView>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int whichPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: whichPage);
    super.initState();
  }

  changePage(index) {
    setState(() {
      whichPage = index;
    });
    swipePage(index);
  }

  swipePage(int index) {
    index != 0
        ? _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut)
        : _pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut);
  }

  Widget CustomAppBar() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: const BoxDecoration(
          color: AppStyle.appBarColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: GestureDetector(
                  onTap: () {
                    print("Edit tapped");
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 70),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 40,
                width: 150,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        changePage(0);
                        print("All tapped");
                      },
                      child: Container(
                        width: 75,
                        height: 40,
                        decoration: BoxDecoration(
                            color: whichPage == 0 ? Colors.blue : Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                topLeft: Radius.circular(8))),
                        child: Center(
                          child: Text(
                            "All",
                            style: TextStyle(
                                color:
                                    whichPage == 0 ? Colors.white : Colors.blue,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        changePage(1);
                        print("Missed tapped");
                      },
                      child: Container(
                        width: 73,
                        height: 40,
                        decoration: BoxDecoration(
                            color: whichPage == 1 ? Colors.blue : Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        child: Center(
                          child: Text(
                            "Missed",
                            style: TextStyle(
                                color:
                                    whichPage == 1 ? Colors.white : Colors.blue,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                print("Add call added");
              },
              icon: const HeroIcon(
                HeroIcons.add_call,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CallPageViewModel>.reactive(
        viewModelBuilder: () => CallPageViewModel(),
        onModelReady: (model) => model.initCallPage(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppStyle.primaryColor,
              key: UniqueKey(),
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: CustomAppBar(),
              ),
              body: PageView(
                physics: PageScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    whichPage = index;
                  });
                },
                controller: _pageController,
                children: model.pages,
              ));
        });
  }
}
