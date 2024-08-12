import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/addNotecubit/addnotescubit.dart';
import 'package:notesapp/models/notemodel.dart';
import 'package:notesapp/widgets/colors_list_view.dart';
import 'package:notesapp/widgets/custembutton.dart';
import 'package:notesapp/widgets/custemtextfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          CustemTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: "Title",
          ),
          CustemTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: "Subtitle",
            maxLines: 5,
          ),
          const ColorsListView(),
          BlocBuilder<AddNotescubit, AddNotesState>(builder: (context, state) {
            return CustemButton(
              isLoading: state is AddNotesLoading ? true : false,
              buttonText: "Add",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var notemodel = Notemodel(
                    title: title!,
                    subtitle: subtitle!,
                    date:
                        "${DateTime.now().year.toString()}-${DateTime.now().month.toString()}- ${DateTime.now().day.toString()}",
                    color: Colors.blueAccent.value,
                  );
                  BlocProvider.of<AddNotescubit>(context).addNotes(notemodel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            );
          })
        ],
      ),
    );
  }
}
