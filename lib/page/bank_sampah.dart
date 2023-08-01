import 'package:flutter/material.dart';
import 'package:itrash_skripsi/page/pembayaran.dart';
import 'package:itrash_skripsi/page/transaksi_sampahform.dart';
import 'package:itrash_skripsi/theme.dart';
import 'package:itrash_skripsi/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class BankSampahPage extends StatelessWidget {
  const BankSampahPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    String? token = authProvider.user?.token;

    AppBar header() {
      return AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Center(
          child: Text('Lakukan Transaksi Sampah Yuk!'),
        ),
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
            Container(
              width: 170,
              height: 200,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (token != null && token.isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TransaksiSampahForm(token)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(token.toString())));
                        }
                      },
                      child: Image.asset(
                        'asset/image_trssampah.png',
                      ),
                    ),
                    Text(
                      'Transaksi Sampah',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 170,
              height: 210,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: backgroundColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pembayaran(token!)));
                      },
                      child: Image.asset(
                        'asset/image_tbgsampah.png',
                      ),
                    ),
                    Text(
                      'Riwayat Transaksi Sampah',
                      style: primaryTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
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
