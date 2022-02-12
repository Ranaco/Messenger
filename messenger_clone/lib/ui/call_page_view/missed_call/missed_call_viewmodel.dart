import 'package:stacked/stacked.dart';

class MissedCallViewModel extends BaseViewModel{

  Map<String, dynamic> calls = {
    "names": [
      "rana", "Ravi", "Shivam",
    ],
    "type": "missed",
    "date": [
      DateTime.now(), DateTime(2017, 9, 5, 4, 3), DateTime.now(),
    ]
  };


}