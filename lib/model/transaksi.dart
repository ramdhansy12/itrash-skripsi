part of 'model.dart';

class TransaksiModel {
  int? id;
  String? noTransaksi;
  DateTime? tanggalTransaksi;
  String? status;
  double? total;

  TransaksiModel({
    this.id,
    this.noTransaksi,
    this.tanggalTransaksi,
    this.status,
    this.total,
  });

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noTransaksi = json['no_transaksi'];
    tanggalTransaksi = json['tanggal_transaksi'];
    status = json['status'];
    total = json['total'];
  }
}
