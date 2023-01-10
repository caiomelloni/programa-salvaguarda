import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/theme/app_colors.dart';

class DataUser extends StatelessWidget {
  final String info;

  const DataUser({
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: AppColors.lightPurple, style: BorderStyle.solid),
        color: AppColors.cinzaClaro,
      ),
      height: 40,
      width: 370,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              info,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.lightPurple,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
