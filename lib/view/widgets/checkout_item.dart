import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/shared/theme.dart';

class CheckoutItem extends StatelessWidget {
  final CartModel cart;
  const CheckoutItem({super.key, required this.cart});

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
    return CachedNetworkImage(
      imageUrl: cart.product!.galleries[0].url!,
      width: 60,
      height: 60,
    );
  }

  Widget _buildName() {
    return Text(
      cart.product!.name!,
      style: whiteTextStyle.copyWith(
        fontWeight: semiBold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPrice() {
    return Text(
      '\$${cart.product!.price!}',
      style: priceTextStyle,
    );
  }

  Widget _buildQuantity() {
    return Text(
      '${cart.quantity} Items',
      style: lightGreyTextStyle.copyWith(
        fontSize: 12,
      ),
    );
  }
}
