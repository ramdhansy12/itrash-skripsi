import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';

class KategoriSampah3 extends StatelessWidget {
  const KategoriSampah3({super.key});

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
                  'Sampah B3',
                  style: primaryTextStyle2.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Limbah B3 merupakan sisa usaha dan/atau kegiatan yang mengandung B3. Limbah B3 dihasilkan dari kegiatan/usaha  baik dari sektor industri, pariwisata, pelayanan kesehatan maupun dari domestik rumah tangga. ',
                  style: subtitleTextStyle2.copyWith(
                      fontSize: 10, fontWeight: light),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Contoh dari dari sampah organik:\nBatrai, Oli Bekas, Aki Bekas, smartphone, AC, mesin cuci, kamera cctv, telepon dan masih banyak lagi. ',
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
