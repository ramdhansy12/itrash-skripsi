import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';
import 'package:itrash_skripsi/widgets/kategori2_sampah.dart';
import 'package:itrash_skripsi/widgets/kategori3_sampah.dart';
import 'package:itrash_skripsi/widgets/kategori_sampah.dart';
import 'package:itrash_skripsi/widgets/news2_card.dart';
import 'package:itrash_skripsi/widgets/news3_card.dart';
import 'package:itrash_skripsi/widgets/news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Halo User',
                    style: primaryTextStyle2.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('asset/image_profile.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget welcome() {
      return Container(
        margin: const EdgeInsets.all(16),
        height: 160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black38),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://images.unsplash.com/photo-1577814576071-04b438d9ff2b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // Widget headingTitle() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: 30,
    //       left: 45,
    //       right: defaultMargin,
    //     ),
    //     child: Text(
    //       'Mau Apa Nih Hari Ini!',
    //       style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
    //     ),
    //   );
    // }

    Widget headingTitle2() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 25,
          right: defaultMargin,
        ),
        child: Text(
          'Hai Kamu, baca berita dulu yuk!',
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
        ),
      );
    }

    // Widget categories() {
    //   return Container(
    //     margin: const EdgeInsets.only(
    //       top: 10,
    //     ),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           SizedBox(
    //             width: defaultMargin,
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 20,
    //               vertical: 10,
    //             ),
    //             margin:
    //                 const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               border: Border.all(color: subtitleColor),
    //               color: backgroundColor,
    //             ),
    //             child: Text(
    //               'Semua Kategori',
    //               style:
    //                   blackTextStyle.copyWith(fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 20,
    //               vertical: 10,
    //             ),
    //             margin: const EdgeInsets.only(
    //               right: 16,
    //             ),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               border: Border.all(color: subtitleColor),
    //               color: transaparentColor,
    //             ),
    //             child: Text(
    //               'Organik',
    //               style: blackTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 20,
    //               vertical: 10,
    //             ),
    //             margin: const EdgeInsets.only(
    //               right: 16,
    //             ),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               border: Border.all(color: subtitleColor),
    //               color: transaparentColor,
    //             ),
    //             child: Text(
    //               'Anorganik',
    //               style: blackTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.symmetric(
    //               horizontal: 20,
    //               vertical: 10,
    //             ),
    //             margin: const EdgeInsets.only(
    //               right: 16,
    //             ),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(12),
    //               border: Border.all(color: subtitleColor),
    //               color: transaparentColor,
    //             ),
    //             child: Text(
    //               'B3',
    //               style: blackTextStyle.copyWith(
    //                 fontSize: 13,
    //                 fontWeight: medium,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget news() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              const Row(
                children: [
                  NewsCard(),
                  NewsCard2(),
                  NewsCard3(),
                  // BeritaCard(),
                ],
              )
            ],
          ),
        ),
      );
    }

    // Widget newsImageCard() {
    //   return Container(
    //     child: Stack(
    //       children: [
    //         Ink.image(
    //           image: NetworkImage(
    //             'https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1176&q=80',
    //           ),
    //           height: 140,
    //         )
    //       ],
    //     ),
    //   );
    // }

    Widget headingTitle4() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 25,
          right: defaultMargin,
        ),
        child: Text(
          'Kenali Kategori dan Jenis Sampah Yu!',
          style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
        ),
      );
    }

    Widget headingTitle3() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: 35,
          right: defaultMargin,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/berita');
          },
          child: Text(
            'Lihat Berita Lainya',
            style: priceTextStyle.copyWith(
                fontSize: 10, fontWeight: light, fontStyle: FontStyle.italic),
          ),
        ),
      );
    }

    Widget categoriesTrash() {
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: const Column(
          children: [
            KategoriSampah(),
            KategoriSampah2(),
            KategoriSampah3(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        // categories(),
        welcome(),
        // headingTitle(),
        headingTitle2(),
        news(),
        headingTitle3(),
        headingTitle4(),
        // newsImageCard(),
        categoriesTrash(),
      ],
    );
  }
}
