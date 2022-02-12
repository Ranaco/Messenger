import 'package:camera/camera.dart';
import 'package:stacked/stacked.dart';

class CameraPageViewModel extends BaseViewModel{

  List<CameraDescription> cameraList = [];
  int selectedCamera = 0;
  Future<void>? initializeCamera;
  XFile? capturedImage;
  CameraController? camera;

  initCameraPage() async {
    setBusy(true);
    cameraList = await availableCameras();
    camera = CameraController(cameraList[selectedCamera], ResolutionPreset.medium);
    initializeCamera = camera!.initialize();
    notifyListeners();
    setBusy(false);
  }

  changeCamera() {
    if(selectedCamera == 0){
      selectedCamera = 1;
      notifyListeners();
    } else {
      selectedCamera = 0;
      notifyListeners();
    }
  }

  capturePic(String file){
    capturedImage = XFile(file);
    notifyListeners();
  }

}