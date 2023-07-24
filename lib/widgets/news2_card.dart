import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';

class NewsCard2 extends StatelessWidget {
  const NewsCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 220,
      margin: EdgeInsets.only(
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://img.antaranews.com/cache/800x533/2023/07/20/IMG-20230720-WA0017.jpg.webp',
            width: 200,
            height: 140,
            fit: BoxFit.fill,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Warga Keluhkan Tumpukan Sampah di Jalan Inspeksi',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle:
                        const TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                  onPressed: () async {
                    Uri.https(
                        'https://www.merdeka.com/jatim/alasan-pentingnya-menjaga-kebersihan-lingkungan-bantu-lindungi-kesehatan-kln.html');
                  },
                  child: const Text(
                    'Baca Selengkpanya....',
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
