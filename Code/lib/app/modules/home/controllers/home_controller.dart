import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:init_project/app/data/person.dart';

class HomeController extends GetxController {
  List<Person?>? listPerson;  
  Box<Person>? DB;
  HomeController() {
    DB = Hive.box('DB');
    listPerson = [];
    for(int i = 0; i < DB!.values.length; i++){
      listPerson!.add(DB!.getAt(i));
    }
  }

  final length = 0.obs;

  //Add Screen
  String? nameAdd, phoneAdd, emailAdd;
  final selectedImagePath = ''.obs;

  //Edit Screen
  Person? currenPersonEdit;
  int? currentIndex;
  String? nameEdit, phoneEdit, emailEdit;

  @override
  void onInit() async{
    length.value = DB!.values.length;
    super.onInit();
  }

  void addPerson(){
    Person person = new Person(name: nameAdd.toString(), phone: phoneAdd.toString(), email: emailAdd.toString(), image: selectedImagePath.toString()); 
    listPerson!.add(person);
    DB!.add(person);
    update();
    length.value++;
    selectedImagePath.value = '';
  }

  void deletePerson(int index){
    listPerson!.removeAt(index);
    DB!.deleteAt(index);
    length.value--;
  }

  void editPerson(int index, String name, String phone, String email, String image){
    Person? person = listPerson![index];
    person!.name = name;
    person.phone = phone;
    person.email = email;
    person.image = image;
    DB!.putAt(index, person);
    listPerson![index] = person;
  }

  Future<void> pickImage(ImageSource source) async{
    final image = await ImagePicker().pickImage(source: source);
    if(image == null){
      Get.snackbar('Error', 'No image selected');
    }
    {
      selectedImagePath.value = image!.path;
    }     
  }
}
