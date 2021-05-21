import 'package:flutter/material.dart';

class InputWidget extends TextFormField {
  InputWidget({String? initialValue, required void Function(String) onChanged, required void Function(String) onFieldSubmitted})
      : super(
            maxLines: null,
            initialValue: initialValue,
            onChanged: onChanged,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              border: InputBorder.none,
            ));
}
