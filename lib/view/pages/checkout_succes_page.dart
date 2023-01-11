import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

import '../widgets/buttons.dart';

class CheckoutSuccesPage extends StatelessWidget {
  const CheckoutSuccesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        title: const Text('Checkout Success'),
      ),
      body: _buildBody(context),
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImage(),
          const SizedBox(height: 20),
          _buildTransactionText(),
          const SizedBox(height: 12),
          _buildPrepareText(),
          const SizedBox(height: 30),
          _buildExploreButton(context),
          const SizedBox(height: 12),
          _buildViewOrderButton(),
        ],
      ),
    );
  }

  Image _buildImage() {
    return Image.asset(
      'assets/icons/empty_cart.png',
      width: 80,
    );
  }

  Text _buildTransactionText() {
    return Text(
      'You made a transaction',
      style: whiteTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _buildPrepareText() {
    return Text(
      'Stay at home while we\nprepare your dream shoes',
      style: lightGreyTextStyle,
      textAlign: TextAlign.center,
    );
  }

  CustomButton _buildExploreButton(BuildContext context) {
    return CustomButton(
      title: 'Explore Store',
      width: 196,
      height: 44,
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      },
    );
  }

  SizedBox _buildViewOrderButton() {
    return SizedBox(
      height: 44,
      width: 196,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff39374B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'View My Order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xffB7B6BF),
          ),
        ),
      ),
    );
  }
}
