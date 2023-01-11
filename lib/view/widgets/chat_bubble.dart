import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool hasProduct;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
    this.hasProduct = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          _productPreview(),
          _chatBubble(context),
        ],
      ),
    );
  }

  Widget _productPreview() {
    return hasProduct
        ? Container(
            width: 230,
            decoration: _productPreviewDecoration(),
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _productImage(),
                const SizedBox(height: 20),
                _productButton()
              ],
            ),
          )
        : const SizedBox();
  }

  Widget _productImage() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/shoes.png',
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'COURT VISION 2.0 SHOES',
                style: whiteTextStyle,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '\$57,15',
                style: priceTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _productButton() {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: purpleColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Add to Cart',
            style: purpleTextStyle,
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: purpleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Buy Now',
            style: blackTextStyle.copyWith(
              color: backgroundColor5,
              fontWeight: medium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _chatBubble(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(
              minWidth: 30,
              maxWidth: MediaQuery.of(context).size.width * 0.6,
              minHeight: 30,
              maxHeight: double.infinity,
            ),
            decoration: _chatBubbleDecoration(),
            padding: const EdgeInsets.all(12),
            child: Text(
              text,
              style: whiteTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration _productPreviewDecoration() {
    return BoxDecoration(
      color: isSender ? backgroundColor5 : backgroundColor4,
      borderRadius: BorderRadius.only(
        topRight:
            !isSender ? const Radius.circular(12) : const Radius.circular(0),
        topLeft:
            isSender ? const Radius.circular(12) : const Radius.circular(0),
        bottomLeft: const Radius.circular(12),
        bottomRight: const Radius.circular(12),
      ),
    );
  }

  BoxDecoration _chatBubbleDecoration() {
    return BoxDecoration(
      color: isSender ? backgroundColor5 : backgroundColor4,
      borderRadius: BorderRadius.only(
        topRight:
            isSender ? const Radius.circular(12) : const Radius.circular(0),
        topLeft:
            !isSender ? const Radius.circular(12) : const Radius.circular(0),
        bottomLeft: const Radius.circular(12),
        bottomRight: const Radius.circular(12),
      ),
    );
  }
}
