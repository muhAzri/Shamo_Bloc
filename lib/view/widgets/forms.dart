import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String icon;
  final String title;
  final TextEditingController? controller;
  final bool isObsecure;

  const CustomFormField({
    super.key,
    required this.icon,
    required this.title,
    this.controller,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          _buildTextFormField(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: whiteTextStyle.copyWith(
        fontSize: 16,
        fontWeight: medium,
      ),
    );
  }

  Widget _buildTextFormField() {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(
        top: 12,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: backgroundColor2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          children: [
            _buildIcon(),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: _buildInputField(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Image.asset(
      icon,
      width: 17,
    );
  }

  Widget _buildInputField() {
    return TextFormField(
      obscureText: isObsecure,
      style: whiteTextStyle,
      decoration: InputDecoration.collapsed(
        hintText: "Your $title",
        hintStyle: greyTextStyle,
      ),
      controller: controller,
    );
  }
}
