import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:note_app/routes/routes_name.dart';
import '../../../controllers/notes_controller.dart';
import '../../../utils/color.dart';
class CustomSingleNotes extends StatelessWidget {
  final int index;
  const CustomSingleNotes({
    super.key,
    required this.index,
    required this.size,
    required this.medium,
    required this.small,


  });
  final Size size;
  final TextStyle? medium;
  final TextStyle? small;

  @override
  Widget build(BuildContext context) {
    final createdDateFormat = DateFormat.yMMMd().format(DateTime.now());
    final createdTimeFormat = DateFormat.jm().format(DateTime.now());
    final updatedDateFormat = DateFormat.yMMMd().format(DateTime.now()??DateTime.now());
    final updatedTimeFormat = DateFormat.jm().format(DateTime.now()??DateTime.now());
    final controller =Get.put(NotesController());
    final note = controller.notes.elementAt(index);
    return InkWell(
      onTap: (){
        Get.toNamed(RoutesName.noteScreen,
        arguments: {
          'isUpdate':true,
           'note':note,
          'index': index,
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: size.height*0.008),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.blackColor.withOpacity(.2)),
        ),
        child: ListTile(
          horizontalTitleGap: 1,
          leading:Container(
            height: size.height*.02,
            width: size.width*.04,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backgroundColor
            ),
          ),
          title: Text(note.title,style: medium,),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: small,),
              note.updatedDate!=null?
              Text('$updatedDateFormat-$updatedTimeFormat',style: small,)
                  :  const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('$createdDateFormat-$createdTimeFormat',style: small,),
                  InkWell(
                      onTap: (){
                        Get.snackbar("Delete", "${note.title} has been deleted",
                        snackPosition: SnackPosition.BOTTOM
                        );
                       controller.deleteNotes(index);
                      },
                      child: const Icon(Icons.delete)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}