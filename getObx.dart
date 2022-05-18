
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXApp extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Obx(()=> Text('My favorite game is ${controller.favorite.value.name}'))
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Using Obx: ', style: TextStyle(fontSize: 30),),
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
  final favorite = Game().obs;

  void changeFavorite(String newFavorite){
    favorite.update((thisGame) {
      //adding '!' bc we wanna tell that this will not be null
      thisGame!.name = newFavorite;
    });
  }
}
//Game object
class Game {
  String name;

  Game({this.name = 'unknown'});
}

