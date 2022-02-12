import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:messenger_clone/model/user_profile_model.dart';
import 'package:messenger_clone/ui/bio_pic_page/bio_pic_page_viewmodel.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icon.dart';
import 'package:messenger_clone/widgets/hero_icon/hero_icons.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.styles.dart';

class BioPicPageView extends StatelessWidget {
  const BioPicPageView({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    TextEditingController _textEditingController = TextEditingController(text: "Hello there!");

    return ViewModelBuilder<BioPicPageViewModel>.reactive(
      onModelReady: (model) => model.initBioPicPage(),
      viewModelBuilder: () => BioPicPageViewModel(),
      builder: (context, model, child){
      return
        model.isBusy ?
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ) :
        Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/backgrounds/rectangle.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: Container(
                  height: 550,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) => CustomBottomSheet(model: model));
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: model.imageFile == null ?
                            const Center(
                              child: ClipOval(child: HeroIcon(HeroIcons.add, color: Colors.grey, size: 50,)),
                            ): Center(
                              child: ClipOval(child: Image.file(model.imageFile!)),
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Upload an optional profile pic and bio!', style: TextStyle(
                                color: Colors.grey.shade400,
                              )),
                            ]
                        ),
                        Container(
                          height: 150,
                          width: 330,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:   Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _textEditingController,
                              onChanged: (value){
                                model.bio = _textEditingController.text;
                              },
                              maxLines: 6,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(onPressed: () {
                          model.uploadFile();
                        }, child: Text(""))
                      ])),
            ),
          ],
        ),
      );
    },);
  }
}

class CustomBottomSheet extends StatelessWidget{
  const CustomBottomSheet({Key? key, required this.model}):super(key: key);
  final BioPicPageViewModel model;
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
