part of 'model.dart';

class PembayaranModel {
  int? id;
  String? keterangan;
  double? total;
  String? noTransaksi;

  PembayaranModel({this.id, this.keterangan, this.total, this.noTransaksi});

  PembayaranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keterangan = json['keterangan'];
    total = double.parse(json['total'].toString());
    noTransaksi = json['pembayaran_transaksi']['no_transaksi'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'keterangan': keterangan,
      'total': total,
      'noTransaksi': noTransaksi,
    };
  }
}
