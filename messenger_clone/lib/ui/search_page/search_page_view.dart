import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/search_page/search_page_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchPageViewModel>.reactive(
      viewModelBuilder: () => SearchPageViewModel(),
      onModelReady: (model) => model.initSearchPage(),
      builder: (context, model, child) {
        return model.isBusy
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                backgroundColor: AppStyle.primaryColor,
                body: Column(
                  children: [
                    const SafeArea(child: SearchTile()),
                    StreamBuilder(
                        stream: model.stream,
                        builder:
                        (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == 'waiting') {
                        return Expanded(
                          flex: 9,
                            child: Container(
                                color: AppStyle.primaryColor,
                                child: GridView.builder(
                                    itemCount: 12,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: AppStyle.greenBlue,
                                          ),
                                          height: 120,
                                          width: 120,
                                        ),
                                      );
                                    })));
                      } else if(snapshot.data == "done"){
                        return  Expanded(
                          child: Scaffold(
                            body: Center(
                              child: Text(
                                model.userTiles.length.toString(),
                              ),
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    })
                  ],
                ));
      },
    );
  }
}

// Expanded(
// child: Container(
// color: AppStyle.primaryColor,
// child: GridView.builder(
//
// itemCount: model.userTiles.length,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index){
// return const Padding(
// padding:  EdgeInsets.all(8.0),
// child:  ProfileTile(),
// );
// })),
// )

class SearchTile extends ViewModelWidget<SearchPageViewModel> {
  const SearchTile({Key? key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, SearchPageViewModel viewModel) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white24, width: 0.5),
    );

    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: viewModel.popPage,
            icon: const HeroIcon(
              HeroIcons.backward_arrow,
              color: Colors.blue,
              size: 23,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  onChanged: (value){
                    viewModel.search = value;
                  },
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                    border: border,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: viewModel.searchForUser,
              icon: const HeroIcon(
                HeroIcons.search,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }
}
