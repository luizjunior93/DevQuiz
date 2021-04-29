import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnsers_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel anwser;
  final bool isSelected;
  final bool disabled;
  final VoidCallback onTap;

  const AwnserWidget({
    Key? key,
    required this.anwser,
    this.isSelected = false,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      anwser.isRght ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      anwser.isRght ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      anwser.isRght ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      anwser.isRght ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      anwser.isRght ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => anwser.isRght ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? _selectedColorCardRight : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected
                        ? _selectedBorderCardRight
                        : AppColors.border))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    anwser.title,
                    style: isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      color: isSelected ? _selectedColorRight : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(BorderSide(
                        color: isSelected
                            ? _selectedBorderRight
                            : AppColors.border,
                      ))),
                  child: isSelected
                      ? Icon(
                          _selectedIconRight,
                          color: AppColors.white,
                          size: 16,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}