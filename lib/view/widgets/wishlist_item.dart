import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/pages/product_page.dart';
import 'package:shamo/view/widgets/buttons.dart';

import '../../models/product_model.dart';
import '../../shared/method.dart';
import '../../state_management/provider/wishlist_provider.dart';

class WishlistItem extends StatefulWidget {
  final ProductModel product;
  const WishlistItem({
    super.key,
    required this.product,
  });

  @override
  // ignore: no_logic_in_create_state
  State<WishlistItem> createState() => _WishlistItemState(product);
}

class _WishlistItemState extends State<WishlistItem> {
  final ProductModel product;

  _WishlistItemState(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: _containerDecoration(),
      child: Row(
        children: [
          _body(),
          _wishlistButton(context),
        ],
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Row(
        children: [
          _productImage(),
          const SizedBox(width: 12),
          _productDetail(),
          const SizedBox(width: 53),
        ],
      ),
    );
  }

  Widget _productImage() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: product),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: product.galleries[0].url!,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _productDetail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        product.name!,
        style: whiteTextStyle.copyWith(fontWeight: semiBold),
      ),
      const SizedBox(height: 2),
      Text(
        '\$${product.price}',
        style: priceTextStyle,
      ),
    ]);
  }

  Widget _wishlistButton(context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return WishlistButton(
      width: 34,
      height: 34,
      iconWidth: 12,
      iconHeight: 10,
      isActive: true,
      onTap: () {
        setState(
          () {
            wishlistProvider.removeProduct(product);
            showWishListSnackbar(
              context,
              false,
            );
          },
        );
      },
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: backgroundColor4,
    );
  }
}
