import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_software_task/modules/background_task_screen/controller/background_task_controller.dart';
import 'package:solid_software_task/modules/background_task_screen/widgets/color_picker_widget.dart';

class BackgroundTaskScreen extends GetView<BackgroundController> {
  const BackgroundTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.backgroundColor.value,
        body: InkWell(
          onTap: () {
            controller.backgroundColor.value = controller.changeColor();
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ColorPickerWidget(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.backgroundColor.value = controller.changeColor();
                  },
                  onLongPress: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Change title'),
                          actions: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 12,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                controller: controller.titleController,
                                onSubmitted: (value) {
                                  controller.saveTitle(value);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.saveTitle(
                                        controller.titleController.text);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Save'),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    controller.title.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: controller.backgroundColor.value == Colors.white
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
