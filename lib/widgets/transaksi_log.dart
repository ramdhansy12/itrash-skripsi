import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';

// ignore: must_be_immutable
class TransaksiLog extends StatelessWidget {
  TransaksiModel transaksiModel;
  TransaksiLog(this.transaksiModel, {super.key});

  @override
  Widget build(BuildContext context) {
    var transaksiModels = transaksiModel;
    String? tanggal = transaksiModels.tanggalTransaksi.toString();
    String? total = transaksiModels.total.toString();

    if (total == "null") {
      total = "0";
    }
    String? noTransaksi = transaksiModels.noTransaksi.toString();
    String? statusTr = transaksiModels.status.toString();

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
                    'Tanggal: $tanggal',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Tanggal: $statusTr',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
