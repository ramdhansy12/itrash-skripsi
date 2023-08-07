import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/services/jenis_sampah_service.dart';

class JenisSampahProvider with ChangeNotifier {
  List<JenisSampah> _jenisSampahs = [];
  List<JenisSampah> get jenisSampahs => _jenisSampahs;

  set jenisSampahs(List<JenisSampah> jenisSampahs) {
    _jenisSampahs = jenisSampahs;
    notifyListeners();
  }

  void getSampah() async {
    try {
      JenisSampahService().getJenisSampah().then((value) {
        _jenisSampahs = value;
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
