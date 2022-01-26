import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 1)
class Person{
  @HiveField(0)
  String name;
  @HiveField(1)
  String phone;
  @HiveField(2)
  String email;
  Person({required this.name, required this.phone, required this.email});
}