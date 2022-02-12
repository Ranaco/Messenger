import 'package:flutter/material.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';

class MyStatusTile extends StatelessWidget {
  const MyStatusTile({Key? key, this.imageUrl = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipOval(
              child: Image.network(imageUrl),
            ),
            Positioned(
              child: GestureDetector(
                child: const HeroIcon(HeroIcons.add_status,color: Colors.blue,),
              ),
            ),
            Positioned(
              top: 39,
              left: 40,
              child: GestureDetector(
                child: const HeroIcon(HeroIcons.add, color: Colors.white,),
              ),
            )
          ],
        ),
        title:const Text("My Status"),
        subtitle: const Text("Add status"),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
                GestureDetector(
                  onTap: (){
                    print("Edit tapped");
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration:const BoxDecoration(
                      color: Color(0xffEDEDFF),
                      shape: BoxShape.circle,
                    ),
                      child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: HeroIcon(HeroIcons.pencil, color: Colors.blue,))),
                ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: (){
                  print("Camera tapped");
                },
                child: Container(
                    height: 40,
                    width: 40,
                    decoration:const BoxDecoration(
                      color: Color(0xffEDEDFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: HeroIcon(HeroIcons.camera_filled, color: Colors.blue,))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
