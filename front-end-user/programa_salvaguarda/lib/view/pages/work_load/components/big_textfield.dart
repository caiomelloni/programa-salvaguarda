import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/view/pages/work_load/components/decorated_input_container.dart';

class BigTextFieldWidget extends StatelessWidget {
  final void Function(String value)? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final bool readOnly;
  const BigTextFieldWidget({
    Key? key,
    this.onChanged,
    this.hintText,
    this.controller,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: DecoratedInputContainer(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,
            onChanged: onChanged,
            minLines: 5,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            cursorHeight: 30,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}
