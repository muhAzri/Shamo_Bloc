import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/wishlist_item.dart';
import '../../../state_management/provider/wishlist_provider.dart';
import '../../widgets/buttons.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Shoes'),
      ),
      body: wishlistProvider.wishlist.isEmpty
          ? _buildEmptyWishlist(context)
          : _buildBody(context, wishlistProvider),
    );
  }

  Widget _buildBody(BuildContext context, WishlistProvider provider) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: backgroundColor3,
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                children: provider.wishlist
                    .map(
                      (wishlist) => WishlistItem(
                        product: wishlist,
                      ),
                    )
                    .toList()),
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
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            },
          )
        ],
      ),
    );
  }
}
