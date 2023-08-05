import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/services/transaksi_service.dart';

class TransaksiProvider with ChangeNotifier {
  List<TransaksiModel> _transaksis = [];
  List<TransaksiModel> get transaksis => _transaksis;

  set transaksis(List<TransaksiModel> transaksis) {
    _transaksis = transaksis;
    notifyListeners();
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
}
