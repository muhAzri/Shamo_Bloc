import 'package:flutter/material.dart';
import 'package:shamo/view/widgets/cart_item.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        title: const Text(
          'Your Cart',
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(),
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/empty_cart.png',
              width: 78,
            ),
            const SizedBox(height: 20),
            Text(
              ' Opss! Your Cart is Empty',
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

    Widget content() {
      return ListView(
        padding: const EdgeInsets.all(30),
        children: const [
          CartItem(),
          CartItem(),
          CartItem(),
          CartItem(),
          CartItem(),
        ],
      );
    }

    Widget customBottomNav() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: whiteTextStyle,
                  ),
                  Text(
                    '\$287,96',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 0.3,
              color: greyColor,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                style: TextButton.styleFrom(
                  backgroundColor: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: whiteColor,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
