import 'package:flutter/material.dart';
import 'package:messenger_clone/app/app.styles.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.name, required this.bio, this.imageUrl, required this.callBack, required this.id}) : super(key: key);
  final String name;
  final String id;
  final Function(String) callBack;
  final String? imageUrl;
  final String? bio;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppStyle.greenBlue,
        ),
        height: 120,
        width: 120,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: SizedBox(
              width: 80,
              child: ClipOval(
                child: imageUrl == null ? const SizedBox() : Image.network(imageUrl!),
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 20,
            child: Text(name ?? "", style: const TextStyle(fontSize: 20),)
          ),
          Positioned(
            top: 140,
            left: 20,
            child: Text(bio ?? "", style: const TextStyle(
              fontSize: 15
            ),),
          ),
          Positioned(
            top: 60,
            left: 120,
            child: IconButton(
              onPressed: (){
                callBack(id);
              },
              icon: const  Icon(Icons.send, color: Colors.blue, size: 30,),
            ),
          )

        ]
      ),
    );
  }
}
