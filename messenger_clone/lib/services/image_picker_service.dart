import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

@lazySingleton
class ImagePickerService {

  final _imagePicker = ImagePicker();

  Future<File?> getImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    File? file = pickedFile != null ? File(pickedFile.path) : null;
    return file == null ? null : _cropFile(file);
  }

  Future <File?> _cropFile(File file) async {
      File? croppedFile = await ImageCropper.cropImage(sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.grey.shade200,
          toolbarTitle: 'Crop Photo',
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
      );
      return croppedFile;
  }
}


