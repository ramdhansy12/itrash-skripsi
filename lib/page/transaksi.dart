import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/providers/transaksi_provider.dart';
import 'package:itrash_skripsi/widgets/transaksi_log.dart';
import 'package:provider/provider.dart';
import 'package:itrash_skripsi/theme.dart';

class Transaksi extends StatefulWidget {
  final String token;
  const Transaksi(this.token, {super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() {
    Provider.of<TransaksiProvider>(context, listen: false)
        .getTransaksi(widget.token);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TransaksiModel> transaksiLogData =
        Provider.of<TransaksiProvider>(context).transaksis.toList();
    // print(transaksiLogData.length);
    // ignore: prefer_is_empty
    if (transaksiLogData.isEmpty && transaksiLogData.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('History Transaksi'),
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
          'History Transaksi',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                color: backgroundColor,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 7, top: 3),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children:
                          transaksiLogData.map((e) => TransaksiLog(e)).toList(),
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
