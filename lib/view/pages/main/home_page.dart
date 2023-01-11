import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/categories_item.dart';
import 'package:shamo/view/widgets/popular_item.dart';
import 'package:shamo/view/widgets/product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, Alex',
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@alexkeinn',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              CategoriesItem(
                title: 'All Shoes',
                isSelected: true,
              ),
              CategoriesItem(
                title: 'Running',
              ),
              CategoriesItem(
                title: 'Training',
              ),
              CategoriesItem(
                title: 'Basketball',
              ),
              CategoriesItem(
                title: 'Hiking',
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular Products',
              style: whiteTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 14,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    PopularItem(),
                    PopularItem(),
                    PopularItem(),
                    PopularItem(),
                    PopularItem(),
                    PopularItem(),
                    PopularItem(),
                    PopularItem(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget newArrival() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Arrivals',
              style: whiteTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 14),
            Column(
              children: const [
                ProductItem(),
                ProductItem(),
                ProductItem(),
                ProductItem(),
                ProductItem(),
                ProductItem(),
                ProductItem(),
              ],
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          header(),
          categories(),
          popularProduct(),
          newArrival(),
        ],
      ),
    );
  }
}
