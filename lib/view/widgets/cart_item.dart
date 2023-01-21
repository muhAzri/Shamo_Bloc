import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/state_management/provider/cart_provider.dart';


class CartItem extends StatelessWidget {
  final CartModel cart;
  const CartItem({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTopRow(cartProvider),
          const SizedBox(height: 12),
          _buildRemoveRow(cartProvider),
        ],
      ),
    );
  }

  Widget _buildTopRow(CartProvider cartProvider) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: cart.product!.galleries[0].url!,
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
                cart.product!.name!,
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '\$${cart.product!.price}',
                style: priceTextStyle,
              ),
            ],
          ),
        ),
        Column(
          children: [
            _buildAddButton(cartProvider),
            const SizedBox(
              height: 2,
            ),
            Text(
              cart.quantity.toString(),
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            _buildRemoveButton(cartProvider),
          ],
        ),
      ],
    );
  }

  Widget _buildAddButton(CartProvider cartProvider) {
    return GestureDetector(
      onTap: () {
        cartProvider.addQuantity(cart.id!);
      },
      child: Container(
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
      ),
    );
  }

  Widget _buildRemoveButton(CartProvider cartProvider) {
    return GestureDetector(
      onTap: () {
        cartProvider.reduceQuantity(cart.id!);
      },
      child: Container(
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
      ),
    );
  }

  Widget _buildRemoveRow(CartProvider cartProvider) {
    return GestureDetector(
      onTap: () {
        cartProvider.removeCart(cart.id!);
      },
      child: Row(
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
      ),
    );
  }
}
