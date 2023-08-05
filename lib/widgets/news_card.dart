import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

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
          Image.asset(
            'asset/news1.jpg.webp',
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
                  height: 15,
                ),
                Text(
                  'Pemda DIY Meminta Kabupaten Kota Kelola Sampah Secara Mandiri',
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
                  onPressed: () async {},
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
