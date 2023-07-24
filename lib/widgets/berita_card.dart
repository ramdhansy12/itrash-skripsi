import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BeritaCard extends StatefulWidget {
  const BeritaCard({super.key});

  @override
  _BeritaCardState createState() => _BeritaCardState();
}

class _BeritaCardState extends State<BeritaCard> {
  final List<Berita> _listBerita = [
    Berita(
      judul: 'Flutter Framework',
      deskripsi: 'Belajar Flutter untuk membuat aplikasi mobile',
      url: 'https://www.liputan6.com/tag/sampah',
    ),
    Berita(
      judul: 'Indonesia Darurat Sampah',
      deskripsi:
          'Indonesia Darurat Sampah Indonesia menjadi salah satu negara penghasil sampah terbanyak di dunia. Menurut data Kementerian Lingkungan Hidup dan Kehutanan (KLHK), pada tahun 2022, Indonesia menghasilkan sekitar 19,45 juta ton sampah. Salah satu penyebab masalah ini adalah minimnya infrastruktur pengelolaan sampah di Indonesia, di mana hanya 54% dari total kabupaten/kota di Indonesia yang memiliki Tempat Pemrosesan Akhir (TPA) yang memadai dan sesuai standar.',
      url: 'https://www.liputan6.com/tag/sampah',
    ),
    Berita(
      judul: 'URL Launcher Package',
      deskripsi: 'Menggunakan package url_launcher untuk membuka URL',
      url: 'https://www.liputan6.com/tag/sampah',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breaking News'),
      ),
      body: ListView.builder(
        itemCount: _listBerita.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_listBerita[index].judul),
              subtitle: Text(_listBerita[index].deskripsi),
              onTap: () {
                _openURL(_listBerita[index].url);
              },
            ),
          );
        },
      ),
    );
  }

  void _openURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Tidak dapat membuka URL: $url';
    }
  }
}

class Berita {
  String judul;
  String deskripsi;
  String url;

  Berita({required this.judul, required this.deskripsi, required this.url});
}
