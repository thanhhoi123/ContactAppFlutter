import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:init_project/app/modules/home/views/add_person_screen.dart';
import 'package:init_project/app/modules/home/views/edit_person_screen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPersonScreen());
        },
        child: Icon(Icons.add),
      ),
      body: Obx((){
        return Column(
          children: <Widget>[
            Container(
              height: height/17,
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search)
                ),
                onChanged: (value){
                  controller.search(value);
                },
              )
            ),
            SingleChildScrollView(
              child: Container(
                height: height*3/4,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue, width: 2)
                ),
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: controller.length.value,
                  itemBuilder: (context, index){
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: ClipOval(child: Image.file(File(controller.listPerson![index]!.image.toString())))
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
              ),
            ),
          ],
        );
      })
    );
  }
}
