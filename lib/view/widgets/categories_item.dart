import 'package:flutter/material.dart';
import 'package:shamo/models/category_model.dart';

import '../../shared/theme.dart';
class CategoriesItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final Function(CategoryModel) onTap;

  const CategoriesItem({
    super.key,
    this.isSelected = false,
    required this.category,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ignore: unnecessary_null_comparison
      onTap: onTap != null ? () => onTap(category) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        margin: const EdgeInsets.only(
          right: 16,
        ),
        decoration: _buildDecoration(),
        child: Text(
          category.name!,
          style: _buildTextStyle(),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isSelected ? transparentColor : greyColor,
      ),
      color: isSelected ? purpleColor : transparentColor,
    );
  }

  TextStyle _buildTextStyle() {
    return isSelected
        ? whiteTextStyle.copyWith(
            fontSize: 13,
          )
        : greyTextStyle.copyWith(
            fontSize: 13,
            fontWeight: light,
          );
  }
}
