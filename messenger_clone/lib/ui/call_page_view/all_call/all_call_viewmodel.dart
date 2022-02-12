import 'package:stacked/stacked.dart';

class AllCallViewModel extends BaseViewModel{

  Map<String, dynamic> callData = {
    "name": [
      "Rauf",
      "Shyla",
      "Eliot Andreson",
      "Novac",
      "Ronaldo",
      "Messi",
      "Lily",
    ],
    "type": [
      "incoming",
      "incoming",
      "incoming",
      "outgoing",
      "missed",
      "missed",
      "outgoing",
    ],
    "imageUrl" : [
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    ]
  };

  setData() async {

  }

  List<String> name = [
    "Rauf",
    "Shyla",
    "Eliot Andreson",
    "Novac",
    "Ronaldo",
    "Messi",
    "Lily",
  ];

  List<String> type = [
    "incoming",
    "incoming",
    "incoming",
    "outgoing",
    "missed",
    "missed",
    "outgoing",
  ];

  List<String> imageUrl = [
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
  ];

  List<DateTime> date = [
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
    DateTime.now(),
  ];
}