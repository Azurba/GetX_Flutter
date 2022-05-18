import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/getxObx.dart';
void main() {
  runApp(GetXApp());
}

class GetXApp extends StatelessWidget {
  // Instantiate your class using Get.put() to make it available for all "child" routes there.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          /*
          Get has two different state managers: the simple state manager
          (we'll call it GetBuilder) and the reactive state manager (GetX/Obx)

          GetBuilder will update its variable on the screen whenever update() is
          called

          GetX is a useful widget when you want to inject the controller into
          the init property, or when you want to retrieve an instance of the
          controller within the widget itself.You just need to add a ".obs" at
          the end of your variable, and wrap the widget you want to change
          within a Obx().
           */
          title: GetBuilder<Controller>(
            builder: (_) => Text('My favorite game is ${controller.favorite}'),
          )
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Using GetBuilder: ', style: TextStyle(fontSize: 30),),
              ElevatedButton(onPressed: (){
                controller.changeFavorite('League of Legends');
              }, child: const Text('League of Legends')),
              ElevatedButton(onPressed: (){
                controller.changeFavorite('AC Odyssey');
              }, child: const Text('AC Odyssey')),
              ElevatedButton(onPressed: (){
                controller.changeFavorite('Runescape');
              }, child: const Text('Runescape')),
            ],
          ),
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  String favorite = 'unknown';

  void changeFavorite(String newFavorite){
    favorite = newFavorite;
    update();
  }
}
