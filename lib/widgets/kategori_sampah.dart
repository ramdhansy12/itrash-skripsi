import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';

class KategoriSampah extends StatelessWidget {
  const KategoriSampah({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
        bottom: defaultMargin,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'asset/image_sampah_anorganik.jpg',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sampah Anorganik',
                  style: primaryTextStyle2.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Sampah anorganik adalah sampah yang sudah tidak dipakai lagi dan sulit terurai ',
                  style: subtitleTextStyle2.copyWith(
                      fontSize: 11, fontWeight: light),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Contoh dari sampah anorganik: \nplastik, botol / kaleng minuman, kresek, ban bekas, besi, kaca, kabel, barang elektronik, bohlam lampu dan plastik',
                  style: subtitleTextStyle2.copyWith(
                      fontSize: 9, fontWeight: light),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
