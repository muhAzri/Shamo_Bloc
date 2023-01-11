import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTopRow(),
          const SizedBox(height: 12),
          _buildRemoveRow(),
        ],
      ),
    );
  }

  Widget _buildTopRow() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/shoes.png',
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terrex Urban Low',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '\$143,98',
                style: priceTextStyle,
              ),
            ],
          ),
        ),
        Column(
          children: [
            _buildAddButton(),
            const SizedBox(
              height: 2,
            ),
            Text(
              '2',
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            _buildRemoveButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: purpleColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.add,
        size: 14,
        color: whiteColor,
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(
        color: Color(0xff3F4251),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.remove,
        size: 14,
        color: whiteColor,
      ),
    );
  }

  Widget _buildRemoveRow() {
    return Row(
      children: [
        Image.asset(
          'assets/icons/remove.png',
          width: 10,
          height: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          'Remove',
          style: alertTextStyle.copyWith(
            fontSize: 12,
            fontWeight: light,
          ),
        )
      ],
    );
  }
}
