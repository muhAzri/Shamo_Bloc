import 'package:flutter/material.dart';
import 'package:shamo/shared/theme.dart';
import 'package:shamo/view/pages/main/chat/chat_page.dart';
import 'package:shamo/view/pages/main/home_page.dart';
import 'package:shamo/view/pages/main/profile/profile_page.dart';
import 'package:shamo/view/pages/main/wishlist_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: greenColor,
        child: Image.asset(
          'assets/icons/cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/home.png',
                    width: 21,
                    color: currentIndex == 0 ? purpleColor : inActiveColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    right: 80,
                  ),
                  child: Image.asset(
                    'assets/icons/chat.png',
                    width: 20,
                    color: currentIndex == 1 ? purpleColor : inActiveColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 80,
                  ),
                  child: Image.asset(
                    'assets/icons/wishlist.png',
                    width: 20,
                    color: currentIndex == 2 ? purpleColor : inActiveColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/icons/profile.png',
                    width: 18,
                    color: currentIndex == 3 ? purpleColor : inActiveColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
