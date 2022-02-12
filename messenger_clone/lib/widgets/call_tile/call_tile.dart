import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';

class CallTile extends StatelessWidget {
  const CallTile(
      {Key? key,
      required this.name,
      required this.type,
      this.imageUrl =
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      required this.date})
      : super(key: key);

  final String name;
  final String type;
  final String imageUrl;
  final DateTime date;
  @override
  Widget build(BuildContext context) {

    String formattedate = DateFormat("dd/MM/yy").format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: const BoxDecoration(
        color: Colors.white,
),
        child: Stack(
          children: [
            Positioned(
                left: 20,
                top: 8,
                child: ClipOval(
                    child: Image.network(
                  imageUrl,
                  height: 60,
                )
                )
      ),
            Positioned(
              left: 110,
              top: 15,
              child: Text(name,
                  style: TextStyle(
                    fontSize: 18,
                    color: type == "missed" ? Colors.red : Colors.black,
                  )),
            ),
            Positioned(
              left: 130,
              top: 40,
              child: Text(type,
                  style: TextStyle(
                      color: type == "missed" ? Colors.red : Colors.grey)),
            ),
            const Positioned(
              top: 45,
              left: 110,
              child: HeroIcon(
                HeroIcons.call_filled,
                color: Colors.grey,
                size: 13,
              ),
            ),
            Positioned(
              left: 280,
              top: 30,
              child: Text(formattedate, style: const TextStyle(fontSize: 15),),
            ),
             Positioned(
               left: 370,
              top: 30,
              child: GestureDetector(
                  onTap: (){
                    print('Info tapped');
                  },
                  child:const HeroIcon(HeroIcons.info, color: Colors.blue,)),
            )
          ],
        ),
      ),
    );
  }
}
