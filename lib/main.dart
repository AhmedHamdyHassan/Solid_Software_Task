import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_software_task/app/app.dart';
import 'package:solid_software_task/modules/background_task_screen/controller/background_task_controller.dart';

void main() {
  Get.lazyPut(
    () => BackgroundController(),
  );
  runApp(const MyApp());
}
