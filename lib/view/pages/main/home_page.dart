import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/state_management/blocs/auth/auth_bloc.dart';
import 'package:shamo/models/category_model.dart';
import 'package:shamo/shared/method.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/pages/product_page.dart';
import 'package:shamo/view/widgets/categories_item.dart';
import 'package:shamo/view/widgets/popular_item.dart';
import 'package:shamo/view/widgets/product_item.dart';

import '../../../state_management/blocs/product/product_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController querry = TextEditingController(text: '');
  late CategoryModel selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = CategoryModel(
      id: 6,
    );
    if (selectedCategory.id != 6) {
      querry.text = selectedCategory.id.toString();
    } else {
      querry.text = '0';
    }
  }

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

              return Container();
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
                  state.categories.sort((a, b) => b.id - a.id);
                  if (selectedCategory.name == null) {
                    selectedCategory = state.categories.first;
                  }
                  return Row(
                    children: state.categories
                        .map(
                          (category) => CategoriesItem(
                            category: category,
                            isSelected: selectedCategory.id == category.id,
                            onTap: (category) {
                              setState(
                                () {
                                  selectedCategory = category;
                                  querry.text = selectedCategory.id.toString();
                                },
                              );
                            },
                          ),
                        )
                        .toList(),
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
                child: BlocProvider(
                  create: (context) => ProductBloc()..add(GetPopularProduct()),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductFailed) {
                        setState(() {
                          showSnackbar(context, state.e);
                        });
                      }
                      if (state is ProductSucces) {
                        return Row(
                          children: state.products
                              .map(
                                (popularProduct) => PopularItem(
                                  popularProduct: popularProduct,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductPage(
                                            product: popularProduct),
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
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
            BlocProvider(
              create: (context) => ProductBloc()..add(GetProdcuts()),
              child: BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {
                  if (state is ProductFailed) {
                    showSnackbar(context, state.e);
                  }
                },
                builder: (context, state) {
                  if (state is ProductSucces) {
                    return Column(
                      children: state.products
                          .map(
                            (product) => ProductItem(
                              product: product,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductPage(product: product),
                                  ),
                                );
                              },
                            ),
                          )
                          .toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
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
