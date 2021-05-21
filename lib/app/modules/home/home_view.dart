import 'package:flutter/material.dart';

import '../note/note_view.dart';
import '../../routes/app_view.dart';
import 'widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> notes = [];

  void addNote({required String message}) {
    notes.add(message);
    setState(() {});
  }

  void removeNote({required int index}) {
    notes.removeAt(index);
    setState(() {});
  }

  Future<void> editNote(int index) async {
    var response = await Navigator.pushNamed(context, AppRouteName.noteEdit, arguments: notes[index]);
    if (response is NoteViewType) {
      if (response == NoteViewType.remove) removeNote(index: index);
    } else if (response is String) {
      notes[index] = response;
      setState(() {});
    }
  }

  Future<void> createNote() async {
    var response = await Navigator.pushNamed(context, AppRouteName.noteCreate);
    if (response != null) {
      addNote(message: response as String);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemCount: notes.length + 1,
          separatorBuilder: (_, __) => SizedBox(height: 16),
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            if (notes.length == index)
              return SizedBox(
                height: 60,
              );
            return ListTileNodeWidget(onTap: () async => await editNote(index), title: notes[index]);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNote,
      ),
    );
  }
}
