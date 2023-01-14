import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/shared/method.dart';

import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/buttons.dart';
import '../../blocs/product/product_bloc.dart';
import '../../models/product_model.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState(product);
}

class _ProductPageState extends State<ProductPage> {
  final ProductModel product;

  List images = [
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png',
  ];

  List familiarShoes = [
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png',
    'assets/images/shoes.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  _ProductPageState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor7,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }

  Future<void> showSuccesDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icons/success.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: lightGreyTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: 'View My Cart',
                    height: 44,
                    width: 154,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget indicator(index) {
    return Container(
      width: currentIndex == index ? 16 : 4,
      height: 4,
      margin: const EdgeInsets.symmetric(
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index ? purpleColor : const Color(0xffC4C4C4),
      ),
    );
  }

  Widget header() {
    int index = -1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  size: 36,
                ),
              ),
              Icon(
                Icons.shopping_bag_rounded,
                color: backgroundColor1,
              ),
            ],
          ),
        ),
        CarouselSlider(
          items: product.galleries
              .map(
                (image) => CachedNetworkImage(
                  imageUrl: image.url!,
                  width: MediaQuery.of(context).size.width,
                  height: 330,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
          options: CarouselOptions(
            initialPage: 0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: product.galleries.map(
            (image) {
              index++;
              return indicator(index);
            },
          ).toList(),
        )
      ],
    );
  }

  Widget content() {
    Widget contentHeader() {
      return Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.category!.name!,
                  style: lightGreyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          WishlistButton(
            isActive: isWishlist,
            onTap: () {
              setState(
                () {
                  isWishlist = !isWishlist;
                  showWishListSnackbar(context, isWishlist);
                },
              );
            },
          ),
        ],
      );
    }

    Widget contentPrice() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price starts from',
              style: whiteTextStyle,
            ),
            Text(
              '\$${product.price}',
              style: priceTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget contentDescription() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              product.description!,
              style: lightGreyTextStyle,
              textAlign: TextAlign.justify,
              maxLines: 5,
            )
          ],
        ),
      );
    }

    Widget contentFamiliarShoes() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Familiar Shoes',
              style: whiteTextStyle.copyWith(fontWeight: medium),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocProvider(
                create: (context) => ProductBloc()..add(GetPopularProduct()),
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductSucces) {
                      return Row(
                        children: state.products.map(
                          (anotherShoes) {
                            return FamiliarShoesCard(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductPage(product: anotherShoes),
                                  ),
                                );
                              },
                              anotherShoes: anotherShoes.galleries[0].url!,
                            );
                          },
                        ).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget contentButtons() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/chat');
              },
              child: Container(
                width: 54,
                height: 54,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: purpleColor,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icons/chat.png',
                    width: 22,
                    height: 22,
                    color: purpleColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                title: 'Add to Cart',
                height: 54,
                onPressed: () {
                  showSuccesDialog();
                },
              ),
            )
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(
        top: 17,
      ),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentHeader(),
          contentPrice(),
          contentDescription(),
          contentFamiliarShoes(),
          contentButtons()
        ],
      ),
    );
  }
}

class FamiliarShoesCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String? anotherShoes;

  const FamiliarShoesCard({super.key, this.onTap, this.anotherShoes});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: CachedNetworkImage(
          imageUrl: anotherShoes!,
          width: 54,
          height: 54,
        ),
      ),
    );
  }
}
