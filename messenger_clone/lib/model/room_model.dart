class Room {
  String name;
  String id;
  String roomName;
  Room({required this.name, required this.id, required this.roomName});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(name: json['name'], id: json['id'], roomName: json['roomName']);
  }

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'id': id,
      'roomName': roomName,
    };
  }

  @override
  String toString() {
    return "Name : $name, Id : $id, roomName: $roomName";
  }
}
