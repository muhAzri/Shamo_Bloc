import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/form_model/checkout_form_model.dart';
import 'package:shamo/shared/method.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/state_management/provider/cart_provider.dart';
import 'package:shamo/view/widgets/buttons.dart';
import 'package:shamo/view/widgets/checkout_item.dart';

import '../../state_management/blocs/transaction/transaction_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/checkout-succes', (route) => false);
          cartProvider.removeAllCart();
        }

        if (state is TransactionFailed) {
          showSnackbar(context, state.e);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundColor3,
          appBar: _buildAppBar(),
          body: _buildContent(context, cartProvider),
        );
      },
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

  Widget _buildContent(BuildContext context, CartProvider cartProvider) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        _buildListHeader(),
        _buildCheckoutItems(context, cartProvider),
        _buildAddressDetails(),
        _buildPaymentSummary(cartProvider),
        _buildButton(context, cartProvider),
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

  Widget _buildCheckoutItems(BuildContext context, CartProvider cartProvider) {
    return Column(
      children: cartProvider.carts
          .map(
            (cart) => CheckoutItem(
              cart: cart,
            ),
          )
          .toList(),
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

  Widget _buildPaymentSummary(CartProvider cartProvider) {
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
                '${cartProvider.totalItems()} Items',
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
                '\$${cartProvider.totalPrice()}',
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
                '\$${cartProvider.totalPrice()}',
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

  Widget _buildButton(BuildContext context, CartProvider cartProvider) {
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
              context.read<TransactionBloc>().add(
                    TransactionPOST(
                      CheckoutFormModel(
                        items: cartProvider.carts
                            .map((cart) => ItemModel(
                                id: cart.product!.id!, quantity: cart.quantity))
                            .toList(),
                        totalPrice: cartProvider.totalPrice(),
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }

  bool isSuccess(BuildContext context, CartProvider cartProvider) {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}
