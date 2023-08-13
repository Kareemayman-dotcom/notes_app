import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:sizer/sizer.dart';

import '../generated/l10n.dart';
import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

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
            hintText: S.of(context).note_textfield_title,
            maxLines: 1,
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomTextField(
            hintText: S.of(context).note_textfield_content,
            maxLines: 250,
            onSaved: (value) {
              content = value;
            },
          ),
          SizedBox(
            height: 1.h,
          ),
          ColorsListView(),
          SizedBox(
            height: 1.h,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                title: title,
                content: content,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var date = DateTime.now();
                    var formatted =
                        DateFormat('dd-MM-yyyy').add_jm().format(date);
                    var noteModel = NoteModel(
                        title: title!,
                        content: content!,
                        date: formatted,
                        // date:
                        //     "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}",
                        color: Colors.blue.value);

                    await BlocProvider.of<AddNoteCubit>(context)
                        .addnote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
