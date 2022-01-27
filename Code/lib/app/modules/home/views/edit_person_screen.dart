import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:init_project/app/modules/home/controllers/home_controller.dart';
import 'package:init_project/app/modules/home/views/home_view.dart';

class EditPersonScreen extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
        actions: <Widget>[
          IconButton(
            onPressed: (){
              controller.editPerson(
                controller.currentIndex!.toInt(), 
                controller.nameEdit.toString(), 
                controller.phoneEdit.toString(), 
                controller.emailEdit.toString(), 
                controller.selectedImagePath.toString()
              );
              Get.to(() => HomeView());
            }, 
            icon: Icon(Icons.check)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: width,
                height: height/3.5,
                color: Colors.blue,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Center(
                      child: Obx((){
                        return Image.file(File(controller.selectedImagePath.value));
                      }),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0,0,15,10),
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context, 
                              builder: (context){
                                return Wrap(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('Camera'),
                                      onTap: () => controller.pickImage(ImageSource.camera),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.image),
                                      title: Text('Gallery'),
                                      onTap: () => controller.pickImage(ImageSource.gallery),
                                    )
                                  ],
                                );
                              }
                            );
                          }, 
                          icon: Icon(Icons.camera_alt, color: Colors.white, size: 40,)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 40,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextFormField(
                          initialValue: '${controller.nameEdit}',
                          onFieldSubmitted: (value) => controller.nameEdit = value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(Icons.phone, size: 40,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextFormField(
                          initialValue: '${controller.phoneEdit}',
                          onFieldSubmitted: (value) => controller.phoneEdit = value,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Icon(Icons.mail, size: 40,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TextFormField(
                          initialValue: '${controller.emailEdit}',
                          onFieldSubmitted: (value) => controller.emailEdit = value,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }    
}
  
