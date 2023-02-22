import 'package:flutter/material.dart';
import 'package:solid_software_task/modules/background_task_screen/view/background_task_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BackgroundTaskScreen(),
    );
  }
}
