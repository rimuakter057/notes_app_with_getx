import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controllers/notes_controller.dart';
import 'package:note_app/models/notes_model.dart';
import '../Widget/custom_button.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var medium = Theme.of(context).textTheme.bodyMedium;

    final controller = Get.put(NotesController());
    final arg = Get.arguments != null?Get.arguments as Map:
    {
      'isUpdate':false,
      'note':null,
    };
    final bool isUpdate = arg ['isUpdate'] ?? false;
    final note= arg['note'] == null ? null: arg['note']as NotesModel;
     final int? index =arg['index'] == null? null: arg['index'] as int;
    final titleController = TextEditingController(
      text: isUpdate ? note!.title:null
    );
    final descriptionController = TextEditingController(
      text: isUpdate?note!.description:null
    );

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1), child: Divider()),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: medium,
              maxLines: 2,
              minLines: 1,
              decoration: const InputDecoration(
                  hintText: "title",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                style: medium,
                maxLines: 50,
                minLines: 50,
                decoration: const InputDecoration(
                    hintText: "describe about your note",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomButton(size: size, medium: medium,
          onTap: () {
        if(
        titleController.text.isEmpty || descriptionController.text.isEmpty
        ){
          Get.snackbar("error","enter your note",snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2),
          );
        }else{
          isUpdate?controller.upDateNotes(index!,
              NotesModel(
                  title: titleController.text,
                  description: descriptionController.text,
                  createdDate: note!.createdDate ,
                  updatedDate: DateTime.now()
              )):
          controller.addNotes(
            NotesModel(
                title: titleController.text,
                description: descriptionController.text,
                createdDate: DateTime.now()),
          );
        }
 Get.back();

          },),
      ),
    );
  }
}


