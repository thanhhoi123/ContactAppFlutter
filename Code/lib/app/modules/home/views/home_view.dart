import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:init_project/app/modules/home/views/add_person_screen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPersonScreen());
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: controller.DB!.values.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('${controller.listPerson![index]!.name}'),
          );
        },
      )
    );
  }
}
