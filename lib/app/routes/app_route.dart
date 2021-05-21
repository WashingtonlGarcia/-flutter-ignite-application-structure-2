import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ignite_flutter_notes/app/modules/home/home_view.dart';
import 'package:ignite_flutter_notes/app/modules/note/note_view.dart';
import 'package:ignite_flutter_notes/app/routes/app_view.dart';

class AppRoute {
  static Route<dynamic> onGeneretaRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteName.noteCreate:
        return MaterialPageRoute(builder: (context) => NoteView.create(), settings: routeSettings);
      case AppRouteName.noteEdit:
        return MaterialPageRoute(builder: (context) => NoteView.edit(), settings: routeSettings);
      case AppRouteName.home:
      default:
        return MaterialPageRoute(builder: (context) => HomeView(), settings: routeSettings);
    }
  }
}
