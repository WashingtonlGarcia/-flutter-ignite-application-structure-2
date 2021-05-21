import 'package:flutter/material.dart';
import 'app/themes/app_theme.dart';
import 'app/routes/app_route.dart';

void main() {
  runApp(MaterialApp(
    title: 'Notes',
    theme: AppTheme.light,
    onGenerateRoute: AppRoute.onGeneretaRoute,
  ));
}
