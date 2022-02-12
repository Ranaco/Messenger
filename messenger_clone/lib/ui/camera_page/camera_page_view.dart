import 'package:camera/camera.dart';
import "package:flutter/material.dart";
import 'dart:io';
import 'camera_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CameraPageView extends StatefulWidget {
  const CameraPageView({Key? key}) : super(key: key);
  @override
  _CameraPageView createState() => _CameraPageView();
}
class _CameraPageView extends State<CameraPageView> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CameraPageViewModel>.reactive(
        viewModelBuilder: () => CameraPageViewModel(),
        onDispose: (model){
          model.camera!.dispose();
        },
        onModelReady: (model) => model.initCameraPage(),
        builder: (context, model, child) {
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
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(model.camera!)),
                Padding(
                  padding: const EdgeInsets.only(top: 680.0, ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(onPressed: model.changeCamera, icon: const Icon(Icons.switch_camera_outlined, color: Colors.white, size: 40,)),
                      const SizedBox(
                        width: 240,
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: model.capturedImage == null ?  null : Image.file(File(model.capturedImage!.path,), fit: BoxFit.cover,),
                      ),
                    ],
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.white,
              onPressed: () async {
                try{
                  await model.initializeCamera;
                  var image = await model.camera!.takePicture();
                  model.capturePic(image.path);
                }catch(e){
                  print(e);
                }
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        });
  }
}


