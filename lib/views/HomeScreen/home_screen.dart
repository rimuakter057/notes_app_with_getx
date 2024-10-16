import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/controllers/notes_controller.dart';
import 'package:note_app/routes/routes_name.dart';
import 'package:note_app/routes/routes_pages.dart';
import 'package:note_app/utils/color.dart';
import 'Widget/custom_single_notes.dart';
import 'Widget/row_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    var large = Theme.of(context).textTheme.bodyLarge;
    var medium = Theme.of(context).textTheme.bodyMedium;
    var small = Theme.of(context).textTheme.bodySmall;
    var controller = Get.put(NotesController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RoutesName.noteScreen),
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(
            side: BorderSide(
          color: AppColors.backgroundColor,
          width: 1,
        )),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "My Notes",
                  style: large,
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                const RowWidget(),
                Expanded(
                  child: Obx(
                    () => SizedBox(
                      child: controller.notes.isEmpty
                          ? Center(
                              child: Text(
                              "No notes here",
                              style: medium,
                            ))
                          : ListView.builder(

                              itemCount: controller.notes.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                final note = controller.notes[index];

                                return CustomSingleNotes(
                                  index: index,
                                  size: size,
                                  medium: medium,
                                  small: small,


                                );
                              }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
