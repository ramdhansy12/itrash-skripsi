import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';

// ignore: must_be_immutable
class PembayaranLog extends StatelessWidget {
  PembayaranModel pembayaranModel;
  PembayaranLog(this.pembayaranModel, {super.key});

  @override
  Widget build(BuildContext context) {
    var pembayanModels = pembayaranModel;
    String? keterangan = pembayanModels.keterangan.toString();
    String? total = pembayanModels.total.toString();
    String? noTransaksi = pembayanModels.noTransaksi.toString();
    print(pembayanModels);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        right: 10,
        left: 10,
        top: 10,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 3, bottom: 7),
                    child: Text(
                      'No Transaksi: $noTransaksi',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total Pembayaran: Rp. $total',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Ket: $keterangan',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
