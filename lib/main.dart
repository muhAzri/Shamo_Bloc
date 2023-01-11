import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/pages/cart_page.dart';
import 'package:shamo/view/pages/checkout_page.dart';
import 'package:shamo/view/pages/checkout_succes_page.dart';
import 'package:shamo/view/pages/main/chat/detail_chat_page.dart';
import 'package:shamo/view/pages/main/main_page.dart';
import 'package:shamo/view/pages/main/profile/edit_profile_page.dart';
import 'package:shamo/view/pages/product_page.dart';
import 'package:shamo/view/pages/sign_in_page.dart';
import 'package:shamo/view/pages/sign_up_page.dart';
import 'package:shamo/view/pages/splash_page.dart';

import 'blocs/auth/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
      ],
      child: MaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/product': (context) => const ProductPage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-succes': (context) => const CheckoutSuccesPage()
        },
      ),
    );
  }

  ThemeData themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: whiteTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
    );
  }
}
