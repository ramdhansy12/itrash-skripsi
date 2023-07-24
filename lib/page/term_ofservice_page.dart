import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';

class TermOfSercivePage extends StatelessWidget {
  const TermOfSercivePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        // leading: IconButton(
        //     // icon: const Icon(Icons.close),
        //     // onPressed: () {
        //     //   Navigator.pop(context);
        //     // },
        //     ),
        backgroundColor: backgroundColor3,
        elevation: 0,
        centerTitle: true,
        title: const Text('Term Of Service'),
        // actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.check,
        //         color: primaryColorWhite,
        //       ),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       })
        // s
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('asset/logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const WidgetSpan(
                    child: SizedBox(
                      width: 20,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Dengan menggunakan aplikasi I-Trash, kamu dianggap telah membaca dan menyetujui ketentuan penggunaan ini. Ketentuan ini merupakan suatu perjanjian sah antara kamu dan aplikasi kami.\nHal-hal umum :\nAplikasi ini merupakan layanan berbentuk perangkat lunak yang menyediakan beragam layanan distribusi sampah dengan cara menghubungkan kamu kepada kurir pengelola sampah terdekat dari lokasi pengguna. Jenis layanan yang ditawarkan melalui aplikasi kami adalah:\n1. Transaksi sampah yang dapat menghasilkan uang dari setiap setor sampah yang dikumpulkan.\n2. Terdapat edukasi mengenai cara pengolahan sampah\n3. Terdapat berita mengenai sampah',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor2,
      appBar: header(),
      body: SingleChildScrollView(
        child: content(),
      ),
    );
  }
}
