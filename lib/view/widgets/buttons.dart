import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text1;
  final String text2;
  final VoidCallback? onTap;

  const CustomTextButton({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: greyTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              text2,
              style: purpleTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WishlistButton extends StatelessWidget {
  final double width;
  final double height;
  final double iconWidth;
  final double iconHeight;

  final bool isActive;
  final VoidCallback? onTap;
  const WishlistButton({
    super.key,
    this.width = 46,
    this.height = 46,
    this.iconWidth = 20,
    this.iconHeight = 18,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? greenColor : backgroundColor6,
        ),
        child: Center(
          child: Image.asset(
            'assets/icons/wishlist.png',
            width: iconWidth,
            height: iconHeight,
            color: isActive ? whiteColor : backgroundColor1,
          ),
        ),
      ),
    );
  }
}
