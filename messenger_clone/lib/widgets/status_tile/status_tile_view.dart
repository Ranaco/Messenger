import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';

class StatusTile extends StatelessWidget {
  const StatusTile(
      {Key? key,
      required this.time,
      required this.name,
      this.imageUrl =
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"})
      : super(key: key);

  final String name;
  final String imageUrl;
  final DateTime time;

  @override
  Widget build(BuildContext context) {

    String formattedTime = DateFormat.Hms().format(time);

    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
         color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 13,
            left: 15,
            child: ClipOval(child: Image.network(imageUrl, height: 50, width: 50,)),),
          Positioned(
            top: 15,
            left: 85,
            child: Text(name, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),), ),
          Positioned(
            top: 55,
            left: 85,
            child: Text(formattedTime),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.9,
            top: 35,
            child: GestureDetector(
              onTap: (){
                print("More tapped");
              },
              child: HeroIcon(HeroIcons.menu, size: 5,),
            ),
          )
        ],
      ),
    );
  }
}
