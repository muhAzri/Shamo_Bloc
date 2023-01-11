import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoriesItem({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(
        right: 16,
      ),
      decoration: _buildDecoration(),
      child: Text(
        title,
        style: _buildTextStyle(),
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
