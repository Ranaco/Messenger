

import 'package:injectable/injectable.dart';

@lazySingleton
class CallDataModel {
  CallDataModel({
    required this.type,
    required this.name,
    required this.imageUrl,
  });
  List<String> name;
  List<String> type;
  List<String> imageUrl;

  factory CallDataModel.fromJson(Map<String, dynamic> json) {
    return CallDataModel(
        type: json['type'], name: json['name'], imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "type": type,
      "imageUrl": imageUrl,
    };
  }
}
