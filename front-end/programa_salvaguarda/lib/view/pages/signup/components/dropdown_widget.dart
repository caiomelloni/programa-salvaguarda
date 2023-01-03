import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/theme/app_colors.dart';

class DropDownWidget extends StatelessWidget {
  final String searchHintText;
  final String label;
  final List<String> options;
  final void Function(String value) onSelected;
  const DropDownWidget({
    Key? key,
    required this.label,
    required this.searchHintText,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        child: DropdownButton(
          items: const [],
          onChanged: null,
          isExpanded: true,
          hint: Text(
            label,
            style: const TextStyle(color: AppColors.lightPurple),
          ),
        ),
        onTap: () => showBottomSheet(
          context: context,
          builder: (context) => OptionsContainer(
            hintText: label,
            options: options,
            onSelected: onSelected,
          ),
        ),
      ),
    );
  }
}

class OptionsContainer extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final void Function(String) onSelected;
  const OptionsContainer({
    Key? key,
    required this.hintText,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<OptionsContainer> createState() => _OptionsContainerState();
}

class _OptionsContainerState extends State<OptionsContainer> {
  final searchController = TextEditingController(text: "");
  late List<String> options;

  @override
  void initState() {
    super.initState();
    options = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.white,
      child: Column(
        children: [
          TextField(
            controller: searchController,
            cursorColor: AppColors.lightPurple,
            decoration: InputDecoration(
              hintText: widget.hintText,
              focusColor: AppColors.lightPurple,
              contentPadding: const EdgeInsets.all(8),
            ),
            onChanged: (_) {
              setState(() {
                options = widget.options
                    .where((listValue) => listValue
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                    .toList();
              });
            },
          ),
          Expanded(
            child: SizedBox(
              child: ListView(
                children: options
                    .map(
                      (listValue) => GestureDetector(
                        child: ListTile(title: Text(listValue)),
                        onTap: () {
                          widget.onSelected(listValue);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
