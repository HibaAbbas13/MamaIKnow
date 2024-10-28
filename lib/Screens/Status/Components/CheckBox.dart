import 'package:flutter/material.dart';
import 'package:mamaiknow/Data/AppColors.dart';

class CheckTab extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final Color checkedColor;
  final Color uncheckedColor;
  final ShapeBorder shape;

  const CheckTab({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
    this.checkedColor = const Color(0XFFCA7CD8), // Default color when checked
    this.uncheckedColor =
        const Color(0XFFF4E5F7), // Default color when unchecked
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: isChecked ? checkedColor : uncheckedColor,
        shape: shape,
        shadows: [
          BoxShadow(
            color: isChecked
                ? checkedColor.withOpacity(0.5)
                : uncheckedColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isChecked ? checkedColor.darker() : uncheckedColor.darker(),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: Text(
            title,
            style: TextStyle(
              color: isChecked ? AppColors.kSecondary : AppColors.kPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Checkbox(
            value: isChecked,
            fillColor: MaterialStateProperty.all(
                isChecked ? uncheckedColor : checkedColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            onChanged: onChanged,
            activeColor: AppColors.kSecondary,
            checkColor: isChecked ? checkedColor : uncheckedColor,
          ),
        ),
      ),
    );
  }
}

extension ColorExtension on Color {
  Color darker() {
    return Color.fromARGB(
      alpha,
      (red * 0.8).round(),
      (green * 0.8).round(),
      (blue * 0.8).round(),
    );
  }
}
