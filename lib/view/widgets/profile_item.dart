import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class ProfileItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ProfileItem({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: lightGreyTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 36,
              color: lightGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
