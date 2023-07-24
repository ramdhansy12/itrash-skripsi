import 'package:flutter/material.dart';

import 'package:itrash_skripsi/page/home/home_page.dart';
import 'package:itrash_skripsi/page/home/profile_page.dart';

import 'package:itrash_skripsi/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/bank-sampah');
        },
        backgroundColor: backgroundColor2,
        child: Image.asset(
          'asset/icon_trash2.png',
          width: 35,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 9,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value) {
              // print(value);
              setState(() {
                currentIndex = value;
              });
              currentIndex = value;
            },
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'asset/icon_home.png',
                      width: 21,
                      color: currentIndex == 0
                          ? primaryColor
                          : const Color.fromARGB(255, 109, 109, 109),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    'asset/icon_profile.png',
                    width: 20,
                    color: currentIndex == 1
                        ? primaryColor
                        : const Color.fromARGB(255, 109, 109, 109),
                  ),
                ),
                label: '',
              ),
              // BottomNavigationBarItem(
              //   icon: Container(
              //     margin: const EdgeInsets.only(top: 10),
              //     child: Image.asset(
              //       'asset/icon_love.png',
              //       width: 22,
              //       color: currentIndex == 2
              //           ? primaryColor
              //           : const Color.fromARGB(255, 109, 109, 109),
              //     ),
              //   ),
              //   label: '',
              // ),
              // BottomNavigationBarItem(
              //   icon: Container(
              //     margin: const EdgeInsets.only(top: 10),
              //     child: Image.asset(
              //       'asset/icon_profile.png',
              //       width: 20,
              //       color: currentIndex == 3
              //           ? primaryColor
              //           : const Color.fromARGB(255, 109, 109, 109),
              //     ),
              //   ),
              //   label: '',
              // )
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
          return const ProfilePage();
        // case 2:
        //   return const WhislistPage();
        // case 3:
        //   return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
