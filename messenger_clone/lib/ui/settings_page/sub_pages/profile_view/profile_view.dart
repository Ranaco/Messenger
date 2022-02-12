import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_clone/app/app.styles.dart';
import 'package:messenger_clone/ui/settings_page/sub_pages/profile_view/profile_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: () => ProfileViewModel(),
        builder: (context, model, index) {

          GlobalKey<FormState> _key = GlobalKey<FormState>();

          return Scaffold(
            backgroundColor: AppStyle.primaryColor,
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 70,
              backgroundColor: AppStyle.appBarColor,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: () {
                    model.popPage();

                  },
                  child: const HeroIcon(
                    HeroIcons.backward_arrow,
                    color: Colors.blue,
                  ),
                ),
              ),
              centerTitle: true,
              leadingWidth: 20,
              title: const Text(
                "Edit Profile",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            body: Form(
              key: _key,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 30,
                          top: 50,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>  CustomBottomSheet(model: model,)
                                  );
                    },
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: model.imageFile == null ? Image.asset("assets/images/no_profile.jpg"): Image.file(model.imageFile!) ,
                                  )
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Text(
                                "Enter your name and add an \noptional profile picture",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 140,
                          left: 57,
                          child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Edit",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )),
                        ),
                        Positioned(
                          top: 180,
                          left: 50,
                          child: Container(
                            width: 300,
                            height: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Positioned(
                          top: 190,
                          left: 30,
                          child: Container(

                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100,
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: model.logOut,
              label: const Text("Log out", style: TextStyle(color: Colors.blue, fontSize: 20),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        });
  }
}




class CustomBottomSheet extends StatelessWidget{
  const CustomBottomSheet({Key? key, required this.model}):super(key: key);
  final ProfileViewModel model;
  @override
  Widget build(BuildContext context,){
    return SizedBox(
      height: 250,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              model.popPage();
              model.changePic(ImageSource.camera);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppStyle.lightBlue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              width: 350,
              height: 70,
              child: const Center(
                child: Text('Camera', style: TextStyle(color: Colors.blue, fontSize: 20),),
              ),
            ),
          ),
          Container(
            height: 2,
            width: 350,
            color: Colors.blue.shade100,
          ),
          GestureDetector(
            onTap: (){
              model.popPage();
              model.changePic(ImageSource.gallery);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppStyle.lightBlue,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              ),
              height: 70,
              width: 350,
              child: const Center(
                child: Text("Gallery", style: TextStyle(color: Colors.blue, fontSize: 20),),
              ),
            ),
          ),
          const  SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: model.popPage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 70,
              width: 350,
              child: const Center(
                child: Text("Cancel", style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}