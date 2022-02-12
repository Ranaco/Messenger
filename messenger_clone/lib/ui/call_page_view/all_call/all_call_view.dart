import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/call_page_view/all_call/all_call_viewmodel.dart';
import 'package:messenger_clone/widgets/call_tile/call_tile.dart';
import 'package:stacked/stacked.dart';

class AllCallView extends StatelessWidget {
  const AllCallView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AllCallViewModel>.reactive(
        viewModelBuilder: () => AllCallViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: AppStyle.primaryColor,
            key: UniqueKey(),
            body: ListView.builder(
                itemCount: model.imageUrl.length,
                itemBuilder: (context, index) {
                  return CallTile(
                      name: model.name[index], type: model.type[index], date: model.date[index],);
                }),
          );
        });
  }
}
