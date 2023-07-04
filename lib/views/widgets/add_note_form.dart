import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  //to show error if the input is wrong or empty (or write the email right), so make it StatfulWidget (change the value if there's problem)

  String? title, subTitle;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            //to get value in title
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  //validate the input
                  validateInput(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  void validateInput(BuildContext context) {
    if (formKey.currentState!.validate()) {
      //to save data
      formKey.currentState!.save();
      String formattedDate =
          DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now());
      var noteModel = NoteModel(
          title: title!,
          subTitle: subTitle!,
          date: formattedDate,
          color: Colors.blue.value);
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      //to validate data during writting (if the CustomTextField empty get error otherwise won't)
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
