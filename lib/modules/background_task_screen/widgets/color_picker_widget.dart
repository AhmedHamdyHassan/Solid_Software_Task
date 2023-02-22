import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_software_task/modules/background_task_screen/controller/background_task_controller.dart';

class ColorPickerWidget extends GetView<BackgroundController> {
  const ColorPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.toggleColorPicker(),
        child: Row(
          children: [
            SizedBox(
              height: 50,
              width: controller.isExpanded.value
                  ? MediaQuery.of(context).size.width
                  : null,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          color: controller.backgroundColor.value,
                        ),
                      ),
                    ),
                    if (controller.isExpanded.value)
                      const VerticalDivider(
                        color: Colors.black,
                      ),
                    if (!controller.isExpanded.value)
                      const Center(
                        child: Text('Background Color'),
                      ),
                    if (controller.isExpanded.value)
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.backgroundColor.value =
                                    // ignore: invalid_use_of_protected_member
                                    controller.colors.value[index];
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  height: 50,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    // ignore: invalid_use_of_protected_member
                                    color: controller.colors.value[index],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: controller.colors.length,
                        ),
                      ),
                    GestureDetector(
                      onTap: () => controller.toggleColorPicker(),
                      child: Icon(
                        controller.isExpanded.value
                            ? Icons.arrow_back_ios_new_outlined
                            : Icons.arrow_forward_ios_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
