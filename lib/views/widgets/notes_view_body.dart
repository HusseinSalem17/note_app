import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(),
          //to let ListViewBuilder take the available space (to use Expanded Widget must be in widget of type flex)
          //type flex => like Column and Row (if used it in stack also take children but stack not flex so will get exception won't appear on screen just in real device)
          Expanded(child: NoteListView()),
        ],
      ),
    );
  }
}

