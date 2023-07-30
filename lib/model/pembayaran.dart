part of 'model.dart';

class PembayaranModel {
  int? id;
  String? keterangan;
  double? total;
  TransaksiModel? transaksiModel;

  PembayaranModel({this.id, this.keterangan, this.total, this.transaksiModel});

  PembayaranModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keterangan = json['keterangan'];
    total = json['total'];
    transaksiModel = TransaksiModel.fromJson(json['pembayaran_transaksi']);
  }
}
