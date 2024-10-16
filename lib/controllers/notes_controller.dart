

import 'package:get/get.dart';
import 'package:note_app/models/notes_model.dart';

class NotesController extends GetxController{
  RxList <NotesModel> notes   =  <NotesModel> [].obs;

  addNotes (NotesModel notesData){
        notes.add(notesData);
        update();
  }
  deleteNotes (int index){
    notes.removeAt(index);
    update();
  }

  upDateNotes (int index, NotesModel notesData){
    notes [index] = notesData;
    update();
  }
}