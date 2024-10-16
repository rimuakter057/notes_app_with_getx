import 'package:get/get.dart';
import 'package:note_app/routes/routes_name.dart';
import 'package:note_app/views/HomeScreen/home_screen.dart';
import 'package:note_app/views/NoteScreen/note_screen.dart';

class RoutesPages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: RoutesName.home, page: () => HomeScreen()),
    GetPage(name: RoutesName.noteScreen, page: ()=> NoteScreen()),
  ];
  

}
