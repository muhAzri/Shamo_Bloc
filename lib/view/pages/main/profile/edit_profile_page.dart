import 'package:flutter/material.dart';

import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/edit_profile_item.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor1,
        title: Text(
          'Edit Profile',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: purpleColor,
              size: 28,
            ),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/profile.png',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const EditProfileItem(
              title: 'Name',
              hintText: 'Alex keinnzal',
            ),
            const EditProfileItem(
              title: 'Username',
              hintText: '@alexkeinn',
            ),
            const EditProfileItem(
              title: 'Email Address',
              hintText: 'alex.kein@gmail.com',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
