import 'package:flutter/material.dart';
import 'package:islami_c19/ui/utils/app_colors.dart';
import 'package:islami_c19/ui/utils/app_text_styles.dart';

class SearchField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchField({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: "Sura name",
          labelStyle: AppTextStyles.white16Bold,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gold)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gold)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.gold))),
      style: AppTextStyles.white16Bold,
      cursorColor: AppColors.gold,
    );
  }
}
