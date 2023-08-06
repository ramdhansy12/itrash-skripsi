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
      judul:
          'Keberhasilan Aksi Konservasi Indonesia Menjadi Contoh Negara-negara ASEAN\n',
      deskripsi:
          'Keberhasilan aksi konservasi keanekaragaman hayati Indonesia menjadi pembelajaran yang baik bagi negara-negara ASEAN. Sebagai negara yang memiliki kekayaan keanekaragaman hayati tinggi, pemerintah Indonesia menaruh perhatian serius dalam konservasi keanekaragaman hayati, sekaligus memfasilitasi masyarakat untuk meningkatkan penghidupannya, melalui kegiatan ekonomi produktif.\n'
          '\nBaca Selengkpanya',
      url:
          'https://www.menlhk.go.id/site/single_post/5476/keberhasilan-aksi-konservasi-indonesia-menjadi-contoh-negara-negara-asean',
    ),
    Berita(
      judul:
          'Gakkum KLHK Tetapkan Aktor Intelektual Penambangan Batubara Tanpa Izin di Kaltim Sebagai Tersangka\n',
      deskripsi:
          'Penyidik Seksi Wilayah 2 Samarinda Balai Gakkum KLHK Wilayah Kalimantan  pada Hari Selasa, tanggal 12 Juli 2023 menetapkan PYS (53 tahun/ Pengawas/Penanggung Jawab) dan AP (24 tahun/Operator) sebagai tersangka kasus penambangan batubara tanpa izin di Hutan Lindung Sungai Manggar Jalan Km 28 Desa Tani Bakti, Kecamatan Samboja, Kabupaten Kutai Kartanegara, Provinsi Kalimantan Timur. Sebelumnya pada Hari Senin, tanggal 11 Juli 2023, Pelaku diamankan oleh Tim Operasi Penegakan Hukum LHK SPORC Brigade Enggang Kalimantan Timur.\n'
          '\nBaca Selengkpanya',
      url:
          'https://www.menlhk.go.id/site/single_post/5462/gakkum-klhk-tetapkan-aktor-intelektual-penambangan-batubara-tanpa-izin-di-kaltim-sebagai-tersangka',
    ),
    Berita(
      judul: 'Indonesia Darurat Sampah\n',
      deskripsi:
          'Indonesia Darurat Sampah Indonesia menjadi salah satu negara penghasil sampah terbanyak di dunia.Menurut data Kementerian Lingkungan Hidup dan Kehutanan (KLHK), pada tahun 2022, Indonesia menghasilkan sekitar 19,45 juta ton sampah. Salah satu penyebab masalah ini adalah minimnya infrastruktur pengelolaan sampah di Indonesia, di mana hanya 54% dari total kabupaten/kota di Indonesia yang memiliki Tempat Pemrosesan Akhir (TPA) yang memadai dan sesuai standar.\n'
          '\nBaca Selengkpanya',
      url: 'https://www.liputan6.com/tag/sampah',
    ),
    Berita(
      judul:
          'Pelaku Perambahanan dan Penebangan Liar di Kawasan Hutan KPH Maria Donggo Massa - NTB Siap Disidangkan\n',
      deskripsi:
          'Tim Penyidik Balai Gakkum KLHK Wilayah Jawa, Bali, dan Nusa Tenggara (Jabalnusra) telah merampungkan berkas perkara kasus perambahan kawasan dan penebangan liar yang terjadi di kawasan hutan KPH Maria Donggo Massa, Kabupaten Bima, Provinsi Nusa Tenggara Barat atas nama tersangka berinisial “J”. Berkas perkara tersebut telah dinyatakan lengkap (P21) oleh Jaksa Penutut Umum Kejaksaan Tinggi Nusa Tenggara Barat\n'
          '\nBaca Selengkpanya',
      url:
          'https://www.menlhk.go.id/site/single_post/5461/pelaku-perambahanan-dan-penebangan-liar-di-kawasan-hutan-kph-maria-donggo-massa-ntb-siap-disidangkan',
    ),
    Berita(
      judul:
          'Saling Belajar Kelola Mangrove, Menteri LHK Ajak Delegasi India Diskusi di TWA Mangrove Angke Kapuk\n',
      deskripsi:
          'Menteri Lingkungan Hidup dan Kehutanan (LHK) Republik Indonesia, Siti Nurbaya menerima kunjungan delegasi dari Kementerian Lingkungan Hidup India di Taman Wisata Alam (TWA) Mangrove Angke Kapuk, Jakarta (10/7/2023). Kunjungan Delegasi KLH India ini ke Indonesia ini dimanfaatkan untuk saling mempelajari tata kelola rehabilitasi mangrove dan upaya-upaya dalam pengendalian perubahan iklim..\n'
          '\nBaca Selengkpanya',
      url:
          'https://www.menlhk.go.id/site/single_post/5455/saling-belajar-kelola-mangrove-menteri-lhk-ajak-delegasi-india-diskusi-di-twa-mangrove-angke-kapuk',
    ),
    Berita(
      judul: 'Indonesia Darurat Sampah\n',
      deskripsi:
          'Indonesia Darurat Sampah Indonesia menjadi salah satu negara penghasil sampah terbanyak di dunia.Menurut data Kementerian Lingkungan Hidup dan Kehutanan (KLHK), pada tahun 2022, Indonesia menghasilkan sekitar 19,45 juta ton sampah. Salah satu penyebab masalah ini adalah minimnya infrastruktur pengelolaan sampah di Indonesia, di mana hanya 54% dari total kabupaten/kota di Indonesia yang memiliki Tempat Pemrosesan Akhir (TPA) yang memadai dan sesuai standar.\n'
          '\nBaca Selengkpanya',
      url: 'https://www.liputan6.com/tag/sampah',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Terikini'),
      ),
      body: ListView.builder(
        itemCount: _listBerita.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'asset/icon_news.png',
                height: 40,
              ),
              Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(_listBerita[index].judul),
                  subtitle: Text(_listBerita[index].deskripsi),
                  onTap: () {
                    _openURL(_listBerita[index].url);
                  },
                ),
              ),
            ],
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
