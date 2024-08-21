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
    this.checkedColor = const Color(0xFFD1FF1B), // Default color when checked
    this.uncheckedColor =
        const Color(0xFF2f2f2f), // Default color when unchecked
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: isChecked
            ? checkedColor
            : uncheckedColor, // Color changes based on isChecked
        shape: shape,
      ),
      child: ListTile(
        leading: Text(
          title,
          style: TextStyle(
            color: isChecked ? Colors.black : Colors.white,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Custom shape
          ),
          onChanged: onChanged,
          activeColor: AppColors.kblueGrey,
          checkColor: isChecked ? checkedColor : uncheckedColor,
        ),
      ),
    );
  }
}
