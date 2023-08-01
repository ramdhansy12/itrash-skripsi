import 'package:flutter/material.dart';
import 'package:itrash_skripsi/page/bank_sampah.dart';
import 'package:itrash_skripsi/page/home/main_page.dart';
import 'package:itrash_skripsi/page/sign_in_page.dart';
import 'package:itrash_skripsi/page/sign_up_page.dart';
import 'package:itrash_skripsi/page/splash_page.dart';
import 'package:itrash_skripsi/page/term_ofservice_page.dart';
// import 'package:itrash_skripsi/page/transaksi_page.dart';
// import 'package:itrash_skripsi/page/transaksi_sampahform.dart';
import 'package:itrash_skripsi/providers/pembayaran_provider.dart';
import 'package:itrash_skripsi/widgets/berita_card.dart';
import 'package:itrash_skripsi/widgets/logsampah_card.dart';
import 'package:itrash_skripsi/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PembayaranProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/termof-service': (context) => const TermOfSercivePage(),
          '/bank-sampah': (context) => const BankSampahPage(),
          // '/transaksi-sampah': (context) => const TransaksiSampah(),
          // '/form-transaksi': (context) => const TransaksiSampahForm(),
          // ignore: prefer_const_constructors
          '/log-sampah': (context) => SampahLog(),
          // ignore: prefer_const_constructors
          '/berita': (context) => BeritaCard(),
        },
      ),
    );
  }
}
