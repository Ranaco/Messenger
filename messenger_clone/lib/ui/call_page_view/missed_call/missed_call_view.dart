import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/call_page_view/all_call/all_call_viewmodel.dart';
import 'package:messenger_clone/ui/call_page_view/missed_call/missed_call_viewmodel.dart';
import 'package:messenger_clone/widgets/call_tile/call_tile.dart';
import 'package:stacked/stacked.dart';


class MissedCallView extends StatelessWidget {
  const MissedCallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MissedCallViewModel>.reactive(
      viewModelBuilder: () => MissedCallViewModel(),
      builder: (context, model, child){
        return Scaffold(
          backgroundColor: AppStyle.primaryColor,
          body: ListView.builder(
            itemCount: model.calls['names'].length,
              itemBuilder: (context, index){
            return CallTile(name: model.calls['names'][index], type: model.calls['type'], date: model.calls['date'][index]);
          }),
        );
      },
    );
  }
}
