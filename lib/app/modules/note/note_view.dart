import 'package:flutter/material.dart';
import 'widgets/widgets.dart';

enum NoteViewType { edit, create, remove }

class NoteView extends StatefulWidget {
  final NoteViewType noteViewType;

  const NoteView.create({Key? key})
      : noteViewType = NoteViewType.create,
        super(key: key);

  const NoteView.edit({Key? key})
      : noteViewType = NoteViewType.edit,
        super(key: key);

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  String message = '';

  NoteViewType get noteViewType => widget.noteViewType;

  void onChanged(String value) {
    message = value;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      message = ModalRoute.of(context)!.settings.arguments as String;
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.noteViewType == NoteViewType.create ? 'Create' : 'Edit'),
        actions: [
          if (noteViewType == NoteViewType.edit) IconButton(onPressed: () => Navigator.pop(context, NoteViewType.remove), icon: Icon(Icons.delete))
        ],
      ),
      body: ListView(padding: EdgeInsets.symmetric(horizontal: 16), children: [
        InputWidget(
            onChanged: onChanged,
            initialValue: message,
            onFieldSubmitted: (String value) {
              if (message.isNotEmpty) Navigator.of(context).pop(message);
            })
      ]),
      bottomNavigationBar: Visibility(
        visible: message.isNotEmpty,
        child: ButtonWidget(title: 'Salvar', onTap: () => Navigator.of(context).pop(message)),
      ),
    );
  }
}
