import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

import '../../models/product_model.dart';

class PopularItem extends StatelessWidget {
  final ProductModel popularProduct;
  final VoidCallback? onTap;

  const PopularItem({
    super.key,
    required this.popularProduct,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _buildPopularItem(context);
  }

  Widget _buildPopularItem(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffECEDEF),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(),
            _buildProductInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    
    return SizedBox(
      width: 215,
      height: 150,
      child: CachedNetworkImage(
        imageUrl: popularProduct.galleries[0].url!,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductHiking(),
          const SizedBox(
            height: 6,
          ),
          _buildProductTitle(),
          const SizedBox(
            height: 6,
          ),
          _buildProductPrice()
        ],
      ),
    );
  }

  Widget _buildProductHiking() {
    return Text(
      popularProduct.category!.name!,
      style: lightGreyTextStyle.copyWith(
        fontWeight: light,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductTitle() {
    return Text(
      popularProduct.name!,
      style: blackTextStyle.copyWith(
        fontSize: 18,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductPrice() {
    return Text(
      '\$${popularProduct.price}',
      style: priceTextStyle.copyWith(
        fontWeight: medium,
      ),
    );
  }
}
