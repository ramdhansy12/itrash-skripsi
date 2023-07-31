import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user!;

    String? userName = user.name!;
    String? email = user.email!;

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(
            defaultMargin,
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'asset/image_profile.png',
                  width: 64,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo ${user.name}',
                      style: primaryTextStyleWht.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign-in', (route) => false);
                },
                child: Image.asset(
                  'asset/button_exit.png',
                  width: 20,
                ),
              )
            ],
          ),
        )),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextSTyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: backgroundColor2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: primaryTextStyle2.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text('Nama: ${userName}'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Email: ${email}'),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: primaryTextStyle2.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/termof-service');
                },
                child: menuItem(
                  'Term Of Service',
                ),
              ),
              menuItem(
                'Rate App',
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
