import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class CheckoutItem extends StatelessWidget {
  const CheckoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _buildImage(),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(),
                const SizedBox(
                  height: 2,
                ),
                _buildPrice(),
              ],
            ),
          ),
          _buildQuantity()
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      'assets/images/shoes.png',
      width: 60,
      height: 60,
    );
  }

  Widget _buildName() {
    return Text(
      'Terrex Urban Low',
      style: whiteTextStyle.copyWith(
        fontWeight: semiBold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPrice() {
    return Text(
      '\$143,98',
      style: priceTextStyle,
    );
  }

  Widget _buildQuantity() {
    return Text(
      '2 Items',
      style: lightGreyTextStyle.copyWith(
        fontSize: 12,
      ),
    );
  }
}
