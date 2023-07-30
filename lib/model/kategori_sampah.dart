part of 'model.dart';

class KategoriSampah {
  int? id;
  String? namaKategori;

  KategoriSampah({this.id, this.namaKategori});

  KategoriSampah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKategori = json['nama_kategori'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'namaKategori': namaKategori};
  }
}
