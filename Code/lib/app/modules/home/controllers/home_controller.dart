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
}
