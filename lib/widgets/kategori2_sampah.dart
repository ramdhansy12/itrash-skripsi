import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';

class KategoriSampah2 extends StatelessWidget {
  const KategoriSampah2({super.key});

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
              'asset/image_sampah_organik.jpg',
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
                  'Sampah Organik',
                  style: primaryTextStyle2.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Sampah organik adalah sampah yang berasal dari sisa mahkluk hidup yang mudah terurai secara alami tanpa proses campur tangan manusia untuk dapat terurai. ',
                  style: subtitleTextStyle2.copyWith(
                      fontSize: 11, fontWeight: light),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Contoh dari dari sampah organik:\nNasi, kulit buah, buah dan sayuran busuk, ampas teh atau kopi, bangkai hewan, dan kotoran hewan',
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
