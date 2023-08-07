part of 'model.dart';

class JenisSampah {
  int? id;
  String? namaSampah;

  JenisSampah({
    this.id,
    this.namaSampah,
  });

  JenisSampah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaSampah = json['nama_sampah'];
  }
}
