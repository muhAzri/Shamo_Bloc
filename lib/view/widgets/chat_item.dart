import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/chat');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            _buildTopRow(),
            const SizedBox(height: 12),
            Divider(
              thickness: 1,
              color: backgroundColor2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      children: [
        Image.asset(
          'assets/images/shop_logo.png',
          width: 54,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShopName(),
              _buildLastMessage(),
            ],
          ),
        ),
        const Spacer(),
        _buildTimestamp(),
      ],
    );
  }

  Widget _buildShopName() {
    return Text(
      'Shoe Store',
      style: whiteTextStyle.copyWith(
        fontSize: 15,
      ),
    );
  }

  Widget _buildLastMessage() {
    return Text(
      'Good night, This item is on...',
      style: lightGreyTextStyle.copyWith(
        fontWeight: light,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTimestamp() {
    return Text(
      'Now',
      style: lightGreyTextStyle,
    );
  }
}
