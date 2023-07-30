part of 'model.dart';

class JenisSampah {
  int? id;
  KategoriSampah? kategoriSampah;
  String? namaSampah;

  JenisSampah({
    this.id,
    this.kategoriSampah,
    this.namaSampah,
  });

  JenisSampah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategoriSampah = KategoriSampah.fromJson(json['kategori_sampah']);
    namaSampah = json['nama_sampah'];
  }
}
