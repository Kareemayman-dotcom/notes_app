import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:sizer/sizer.dart';

import 'custom_button.dart';
import 'custom_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 50.h),
      padding: EdgeInsets.only(
        top: 2.h,
        right: 5.w,
        left: 5.w,
      ),
      decoration: BoxDecoration(
          color: ThemeData.dark().canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
            hintText: "Title",
            maxLines: 1,
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            hintText: "content",
            maxLines: 250,
            onSaved: (value) {
              content = value;
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomButton(
            title: title,
            content: content,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }
}
