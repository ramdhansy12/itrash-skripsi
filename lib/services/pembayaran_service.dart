import 'dart:convert';
import 'package:itrash_skripsi/model/model.dart';
import 'package:http/http.dart' as http;

class PembayaranService {
  String baseUrl = 'https://itrash.technosolution.site/api';
  // String baseUrl = 'http://192.168.56.56/api';

  Future<List<PembayaranModel>> getPembayaran(String token) async {
    var url = '$baseUrl/pembayaran';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var responses = await http.post(Uri.parse(url), headers: headers);

    if (responses.statusCode == 200) {
      List listPembayaran = json.decode(responses.body)['data'];
      List<PembayaranModel> pembayaran = [];

      for (var item in listPembayaran) {
        pembayaran.add(PembayaranModel.fromJson(item));
      }

      return pembayaran;
    } else {
      throw Exception('Gagal Ambil Data');
    }
  }
}
