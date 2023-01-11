import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/wishlist_item.dart';
import '../../widgets/buttons.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Shoes'),
      ),
      body: _buildBody(context),
      // body: _buildEmptyWishlist(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: backgroundColor3,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: const [
                WishlistItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyWishlist(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor3,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/love.png',
            width: 74,
          ),
          const SizedBox(height: 20),
          Text(
            'You don\'t have dream shoes??',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Let\'s find your favorite shoes',
            style: lightGreyTextStyle,
          ),
          const SizedBox(height: 20),
          CustomButton(
            title: 'Explore Store',
            width: 152,
            height: 44,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
