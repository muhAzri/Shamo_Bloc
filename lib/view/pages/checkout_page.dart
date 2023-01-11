import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/buttons.dart';
import 'package:shamo/view/widgets/checkout_item.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: _buildAppBar(),
      body: _buildContent(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: backgroundColor1,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: SizedBox(),
      ),
      title: const Text('Checkout Details'),
    );
  }

  Widget _buildContent(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        _buildListHeader(),
        _buildCheckoutItems(),
        _buildAddressDetails(),
        _buildPaymentSummary(),
        _buildButton(context),
      ],
    );
  }

  Text _buildListHeader() {
    return Text(
      'List Items',
      style: whiteTextStyle.copyWith(
        fontSize: 16,
        fontWeight: medium,
      ),
    );
  }

  Widget _buildCheckoutItems() {
    return Column(
      children: const [
        CheckoutItem(),
        CheckoutItem(),
      ],
    );
  }

  Widget _buildAddressDetails() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address Details',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icons/store_location.png',
                    width: 40,
                  ),
                  Image.asset(
                    'assets/icons/line.png',
                    height: 30,
                  ),
                  Image.asset(
                    'assets/icons/your_address.png',
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Store Location',
                    style: lightGreyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'Adidas Core',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Your Address',
                    style: lightGreyTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'Marsemoon',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Quantity',
                style: lightGreyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                '2 Items',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Price',
                style: lightGreyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                '\$575.96',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping',
                style: lightGreyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              Text(
                'Free',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: priceTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                '\$575.92',
                style: priceTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          const Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            title: 'Checkout Now',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/checkout-succes', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
