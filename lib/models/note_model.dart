// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

//the name of file will be generated must be same name for class name (note_model) otherwise will appear error
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color;
  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
/*
Hive Steps (dependency injection)
1. extends HiveObject (optional but better to make it)
2. typeAdapter (1. HiveType typeId from 0 => 255 must be special for this object the same with fields (have unique id per class)
  2. use keyWord par '' like import but this to put the name of file that will be generated (.g => will be generated, .dart => lang dart))
3. put this line in terminal (flutter packages pub run build_runner build), then the code will be generated using annotations
4. (to support Hive) make main async then await use package Hive.initFlutter() (must import Hive Flutter)
5. open the box that'll store data (or collection), so made this Hive.openBox(kNotesBox);
6. Hive.registerAdapter(NoteModelAdapter()) => after generate the typeAdapter ,i need to tell Hive to use NoteModel(type)

*/

