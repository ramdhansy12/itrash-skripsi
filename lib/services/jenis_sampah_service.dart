import 'dart:convert';
import 'package:itrash_skripsi/model/model.dart';
import 'package:http/http.dart' as http;

class JenisSampahService {
  // String baseUrl = 'http://192.168.56.56/api';
  String baseUrl = 'https://itrash.technosolution.site/api';

  Future<List<JenisSampah>> getJenisSampah() async {
    var url = '$baseUrl/jenis-sampah';
    var headers = {
      'Content-Type': 'application/json',
    };

    var responses = await http.get(Uri.parse(url), headers: headers);

    if (responses.statusCode == 200) {
      List listJenisSampah = json.decode(responses.body)['data'];

      List<JenisSampah> jenisSampah = [];

      for (var item in listJenisSampah) {
        jenisSampah.add(JenisSampah.fromJson(item));
      }

      return jenisSampah;
    } else {
      throw Exception("gagal ambil data");
    }
  }
}
