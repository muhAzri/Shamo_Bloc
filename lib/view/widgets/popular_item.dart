import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPopularItem(context);
  }

  Widget _buildPopularItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
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
          children: [_buildProductImage(), _buildProductInfo()],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Image.asset(
      'assets/images/shoes.png',
      width: 215,
      height: 150,
      fit: BoxFit.cover,
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
      'Hiking',
      style: lightGreyTextStyle.copyWith(
        fontWeight: light,
      ),
    );
  }

  Widget _buildProductTitle() {
    return Text(
      'COURT VISION 2.0',
      style: blackTextStyle.copyWith(
        fontSize: 18,
        fontWeight: semiBold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductPrice() {
    return Text(
      '\$58,67',
      style: priceTextStyle.copyWith(
        fontWeight: medium,
      ),
    );
  }
}
