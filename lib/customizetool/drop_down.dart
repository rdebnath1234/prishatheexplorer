import 'package:flutter/material.dart';
class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;

  AppDropdownInput({
    this.hintText = '',
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(

      builder: (FormFieldState<T> state) {
        return InputDecorator(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20.0, vertical: 15.0),
            labelText: hintText,

          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: Center(
              child: DropdownButton<T>(

                value: value,
                isDense: true,
                onChanged: onChanged,
                items: options.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Text(getLabel(value)),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}