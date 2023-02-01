import 'package:flutter/services.dart';

class CardFormatter extends TextInputFormatter {
  final String? sample;
  final List<String>? separator;

  CardFormatter({required this.sample, required this.separator}) {
    assert(sample != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > sample!.length) return oldValue;
        if (newValue.text.length < sample!.length) {
          for (int i = 0; i < separator!.length; i++) {
            if (sample![newValue.text.length - 1] == separator![i]) {
              return TextEditingValue(
                  text:
                      "${oldValue.text}${separator![i]}${newValue.text.substring(newValue.text.length - 1)}",
                  selection: TextSelection.collapsed(
                      offset: newValue.selection.end + 1));
            }
          }
        }
      }
    }
    return newValue;
  }
}
