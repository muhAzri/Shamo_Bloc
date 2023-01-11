import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/buttons.dart';
import 'package:shamo/view/widgets/chat_item.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        title: const Text('Message Support'),
      );
    }

    Widget emptyContent() {
      return Expanded(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/headset.png',
                width: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'Opss no message yet?',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'You have never done a transaction',
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
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgroundColor3,
          ),
          padding: const EdgeInsets.only(top: 30),
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: const [
              ChatItem(),
              ChatItem(),
              ChatItem(),
              ChatItem(),
              ChatItem(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyContent(),
        content()
      ],
    );
  }
}
