import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/blocs/auth/auth_bloc.dart';
import 'package:shamo/models/category_model.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/widgets/categories_item.dart';
import 'package:shamo/view/widgets/popular_item.dart';
import 'package:shamo/view/widgets/product_item.dart';

import '../../../blocs/product/product_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSucces) {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hallo, ${state.user.name}',
                            style: whiteTextStyle.copyWith(
                              fontSize: 24,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            '@${state.user.username}',
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            state.user.profilePicture!,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocProvider(
            create: (context) => ProductBloc()..add(CategoriesGet()),
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is CategoriesSuccess) {
                  return Row(
                    children: [
                      CategoriesItem(
                        category: CategoryModel(name: 'All Shoes'),
                        isSelected: true,
                      ),
                      Row(
                        children: state.categories
                            .map(
                              (category) => CategoriesItem(
                                category: category,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
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
