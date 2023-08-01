import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/services/pembayaran_service.dart';

class PembayaranProvider with ChangeNotifier {
  List<PembayaranModel> _pembayarans = [];
  List<PembayaranModel> get pembayarans => _pembayarans;

  PembayaranModel? _pembayaran;
  PembayaranModel? get pembayaran => _pembayaran;

  set pembayarans(List<PembayaranModel> pembayarans) {
    _pembayarans = pembayarans;
    notifyListeners();
  }

  // set pembayaran(PembayaranModel? pembayaran) {
  //   _pembayaran = pembayaran;
  //   notifyListeners();
  // }

  void getPembayaran(String token) {
    try {
      PembayaranService().getPembayaran(token).then((value) {
        _pembayarans = value;
      });
    } catch (e) {}
  }
}
