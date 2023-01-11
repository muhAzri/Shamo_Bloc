import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/shop_logo_online.png',
                width: 50,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: whiteTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: lightGreyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 225,
        height: 74,
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
            color: backgroundColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: purpleColor,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/shoes.png',
                width: 54,
                height: 54,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COURT VISIO..',
                    style: whiteTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
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
            GestureDetector(
              child: Image.asset(
                'assets/images/button_close.png',
                width: 22,
              ),
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: backgroundColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Typle Message...',
                          hintStyle: greyTextStyle,
                        ),
                        style: whiteTextStyle,
                        cursorColor: whiteColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: purpleColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/submit.png',
                        width: 19,
                        height: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: const [
          ChatBubble(
            text: 'Hi, This item is still available?',
            isSender: true,
            hasProduct: true,
          ),
          ChatBubble(
            text: 'Good night, This item is only available in size 42 and 43',
            isSender: false,
          ),
          ChatBubble(
            text: 'Owww, it suits me very well',
            isSender: true,
          )
        ],
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor3,
        appBar: header(),
        bottomNavigationBar: chatInput(),
        resizeToAvoidBottomInset: true,
        body: content());
  }
}
