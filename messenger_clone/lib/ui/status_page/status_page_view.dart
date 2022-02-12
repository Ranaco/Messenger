import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/status_page/status_page_viewmodel.dart';
import 'package:messenger_clone/widgets/my_status_tile/my_status_tile.dart';
import 'package:messenger_clone/widgets/status_tile/status_tile_view.dart';
import 'package:stacked/stacked.dart';

class StatusPageView extends StatelessWidget {
  const StatusPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatusPageViewModel>.reactive(
        viewModelBuilder: () => StatusPageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppStyle.primaryColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: 70,
                    decoration: const BoxDecoration(
                      color: AppStyle.appBarColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Privacy tapped");
                          },
                          child: const Text(
                            "Privacy",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 5),
                          child: GestureDetector(
                            child: const Text(
                              "Status",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: MyStatusTile(),
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Text(
                        "Stories",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: model.names.isEmpty ? 1 : model.names.length,
                      itemBuilder: (context, index) {
                        return model.names.isEmpty
                            ?const NoStoryContainer()
                            : StatusTile(
                                name: model.names[index],
                                time: DateTime.now(),
                              );
                      }),
                )
              ],
            ),
          );
        });
  }
}

class NoStoryContainer extends ViewModelWidget<StatusPageViewModel> {
  const NoStoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, StatusPageViewModel viewModel) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              "No recent updates to show right now",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
