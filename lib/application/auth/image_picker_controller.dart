import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zelda_guide/constants.dart';

class ImagePickerController extends GetxController {
  final image = ImagePicker();

  Box box = Hive.box(BoxStorage.boxName);

  Rx<Image?> pickedImage = Rx(null);
  Rx<Uint8List?> pickedImageData = Rx(null);

  getProfilePic() {
    final base64image = box.get(BoxStorage.keys.profilPic);

    if (base64image != null) {
      pickedImage.value = Image.memory(base64Decode(base64image));
    }
  }

  _storeImage(Uint8List bytes) async {
    final base64image = base64Encode(bytes);

    await box.put(BoxStorage.keys.profilPic, base64image);
  }

  pickImage({double? width, double? height}) async {
    final pickedFile = await image.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (kIsWeb) {
        pickedImage.value = Image.network(
          pickedFile.path,
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      } else {
        pickedImage.value = Image.file(
          File(pickedFile.path),
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      }
      _storeImage(await pickedFile.readAsBytes());
      pickedImageData.value = await pickedFile.readAsBytes();
    }
  }

  clear() {
    pickedImage.value = null;
    pickedImageData.value = null;
  }

  @override
  void onInit() {
    getProfilePic();
    super.onInit();
  }
}
