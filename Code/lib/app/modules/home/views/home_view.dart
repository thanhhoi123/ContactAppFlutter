import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:init_project/app/modules/home/views/add_person_screen.dart';
import 'package:init_project/app/modules/home/views/edit_person_screen.dart';

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
      body: Obx((){
        return Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: ListView.builder(
            itemCount: controller.length.value,
            itemBuilder: (context, index){
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Container(
                    margin: EdgeInsets.all(4),
                    child: Image.file(File(controller.listPerson![index]!.image.toString()))
                  ),
                  title: Text('${controller.listPerson![index]!.name}'),
                  onLongPress: () => controller.deletePerson(index),
                  onTap: () {
                    controller.currenPersonEdit = controller.listPerson![index];
                    controller.nameEdit = controller.currenPersonEdit!.name;
                    controller.phoneEdit = controller.currenPersonEdit!.phone;
                    controller.emailEdit = controller.currenPersonEdit!.email;
                    controller.currentIndex = index;
                    controller.selectedImagePath.value = controller.currenPersonEdit!.image.toString();
                    Get.to(() => EditPersonScreen());
                  },
                ),
              );
            },
          ),
        );
      })
    );
  }
}
