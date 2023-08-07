import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/services/transaksi_service.dart';

class TransaksiProvider with ChangeNotifier {
  List<TransaksiModel> _transaksis = [];
  List<TransaksiModel> get transaksis => _transaksis;

  TransaksiModel? _transaksiModel;
  TransaksiModel? get transaksiModel => _transaksiModel;

  set transaksis(List<TransaksiModel> transaksis) {
    _transaksis = transaksis;
    notifyListeners();
  }

  set transaksi(TransaksiModel? transaksiModel) {
    _transaksiModel = transaksiModel;
  }

  void getTransaksi(String token) async {
    try {
      TransaksiService().getTransaksi(token).then((value) {
        _transaksis = value;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> submitTransaksi(String token, int idSampah, int berat) async {
    try {
      TransaksiModel transaksiModel =
          await TransaksiService().submitTransaksi(token, idSampah, berat);
      _transaksiModel = transaksiModel;

      return true;
    } catch (e) {
      return false;
    }
  }
}
