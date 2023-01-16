import 'package:flutter/material.dart';
import 'package:flutter_desktop_app_design_template/io/app_style.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'io/app_manager.dart';

void main() async {
  await AppManager.initAppData();
  runApp(const App());

  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

void rebuildApp(){
  // app rebuild logic here
}

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialApp(
        color: AppStyle.backgroundColor,
        home: Scaffold(
          backgroundColor: AppStyle.backgroundColor,
          body: Stack(
            children: [
              ContentPane(),
              Align(
                child: MoveWindow(),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class ContentPane extends StatelessWidget{
  const ContentPane({super.key});

  @override
  Widget build(BuildContext context) {
    return AppManager.getView();
  }

}

