import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  String name;
  String email;
  String id;
  String? avatar_url;
  String docId;
  List? friend;
  String? bio;
  UserProfile(
      {required this.name,
      required this.email,
      this.avatar_url,
      this.bio,
      required this.docId,
      this.friend,
      required this.id});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        name: json['name'],
        email: json['email'],
        id: json['id'],
        docId: json['docId'],
        avatar_url: json['avatar_url'],
        bio: json['bio'],
        friend: json['friend']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'docId': docId,
      'avatar_url': avatar_url,
      'bio': bio,
      'friend': friend,
    };
  }

  @override
  String toString() {
    return "name: $name, email: $email, id: $id, bio: $bio, friend: ${friend.toString()}, avatar_url : $avatar_url, docId: $docId";
  }

  @override
  int get hashCode {
    return id.hashCode ^
        bio.hashCode ^
        docId.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatar_url.hashCode ^
        friend.hashCode;
  }

  UserProfile copyWith({
    String? id,
    String? name,
    String? docId,
    String? avatar_url,
    String? email,
    String? bio,
    List? friend,
  }) {
    return UserProfile(
        name: name ?? this.name,
        email: email ?? this.email,
        docId: docId ?? this.docId,
        id: id ?? this.id,
        avatar_url: avatar_url ?? this.avatar_url,
        bio: bio ?? this.bio,
        friend: friend ?? this.friend);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfile &&
        other.name == name &&
        other.email == email &&
        other.bio == bio &&
        other.friend == friend &&
        other.avatar_url == avatar_url &&
        other.id == id;
  }
}
