import 'dart:convert';
// import 'dart:developer';
import 'package:itrash_skripsi/model/model.dart';
import 'package:http/http.dart' as http;

class TransaksiService {
  // String baseUrl = 'http://192.168.56.56/api';
  String baseUrl = 'https://itrash.technosolution.site/api';

  Future<List<TransaksiModel>> getTransaksi(String token) async {
    var url = '$baseUrl/transaksi';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var responses = await http.post(Uri.parse(url), headers: headers);

    if (responses.statusCode == 200) {
      List listTransaksi = json.decode(responses.body)['data'];
      List<TransaksiModel> transaksi = [];

      for (var item in listTransaksi) {
        transaksi.add(TransaksiModel.fromJson(item));
      }
      return transaksi;
    } else {
      throw Exception("gagal ambil data");
    }
  }

  Future<TransaksiModel> submitTransaksi(
      String token, int idSampah, int berat) async {
    var url = '$baseUrl/transaksi/store';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var responses = await http.post(Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          'jenis_sampah_id': idSampah,
          'qty': berat,
        }));

    if (responses.statusCode == 200) {
      var data = jsonDecode(responses.body)['data'];

      TransaksiModel transaksiModel = TransaksiModel.fromJson(data);

      return transaksiModel;
    } else {
      throw Exception('transaksi gagal!');
    }
  }
}
