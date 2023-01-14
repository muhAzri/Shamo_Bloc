import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

import '../../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductItem({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            _productImage(),
            const SizedBox(
              width: 12,
            ),
            Expanded(child: _productDetail(),)
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return SizedBox(
      width: 120,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: product.galleries[0].url!,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _productDetail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        product.category!.name!,
        style: lightGreyTextStyle.copyWith(
          fontSize: 12,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        product.name!,
        style: whiteTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      const SizedBox(height: 6),
      Text(
        '\$${product.price}',
        style: priceTextStyle.copyWith(
          fontWeight: medium,
        ),
      )
    ]);
  }
}
