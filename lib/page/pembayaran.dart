import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/providers/pembayaran_provider.dart';
import 'package:itrash_skripsi/widgets/pembayaran_log.dart';
import 'package:provider/provider.dart';
import 'package:itrash_skripsi/theme.dart';

class Pembayaran extends StatefulWidget {
  final String token;
  const Pembayaran(this.token, {super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() {
    Provider.of<PembayaranProvider>(context, listen: false)
        .getPembayaran(widget.token);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PembayaranModel> pembayaranData =
        Provider.of<PembayaranProvider>(context).pembayarans.toList();
    // ignore: prefer_is_empty
    if (pembayaranData.isEmpty && pembayaranData.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Log Transaksi Sampah'),
        ),
        body: ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) {
            return const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Data Kosong"),
                subtitle: Text('Data Kosong'),
              ),
            );
          },
        ),
      );
    }
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Log Transaksi Sampah'),
    //   ),
    //   body: ListView(
    //       children: pembayaranData
    //           .map(
    //             (e) => PembayaranLog(e),
    //           )
    //           .toList()),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'History Pembayaran Bank Sampah',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 90,
                margin: const EdgeInsets.only(bottom: 7, top: 3),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                color: backgroundColor,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children:
                          pembayaranData.map((e) => PembayaranLog(e)).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
