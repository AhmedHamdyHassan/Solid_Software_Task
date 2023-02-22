import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundController extends GetxController {
  Rxn<Color> backgroundColor = Rxn<Color>();
  RxList<Color> colors = RxList<Color>();
  RxBool isExpanded = false.obs;
  RxString title = 'Hey there.'.obs;
  TextEditingController titleController = TextEditingController();

  Color changeColor() {
    int generatedColor = Random().nextInt(Colors.primaries.length);
    return Colors.primaries[generatedColor];
  }

  void saveTitle(String newTitle) {
    title.value = newTitle;
  }

  void setColorPickerColors() {
    colors.clear();
    for (int i = 0; i < 20; i++) {
      // ignore: invalid_use_of_protected_member
      colors.value.add(changeColor());
    }
  }

  void toggleColorPicker() {
    isExpanded.value = !isExpanded.value;
    if (!isExpanded.value) {
      setColorPickerColors();
    }
  }

  @override
  void onInit() {
    super.onInit();
    backgroundColor.value = changeColor();
    setColorPickerColors();
  }
}
