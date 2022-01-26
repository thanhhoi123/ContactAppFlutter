import 'package:get/get.dart';
import 'package:hive/hive.dart';
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

  //Add Screen
  String? nameAdd, phoneAdd, emailAdd;
  @override
  void onInit() async{

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void addPerson(){
    listPerson!.add(new Person(name: nameAdd.toString(), phone: phoneAdd.toString(), email: emailAdd.toString()));
    DB!.add(new Person(name: nameAdd.toString(), phone: phoneAdd.toString(), email: emailAdd.toString()));
    update();
  }
}
