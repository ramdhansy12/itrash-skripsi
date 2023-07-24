import 'package:flutter/material.dart';

class SampahLog extends StatefulWidget {
  const SampahLog({super.key});

  @override
  _SampahLogState createState() => _SampahLogState();
}

class _SampahLogState extends State<SampahLog> {
  final List<LogTransaksi> _logTransaksi = [
    LogTransaksi(
      nama: 'Ramdhan Syaifulloh',
      jenisSampah: 'Plastik',
      berat: 3.5,
      pendapatan: "Rp.75.0000",
      tanggal: '2023-07-25',
    ),
    LogTransaksi(
        nama: 'Ramdhan Syaifulloh',
        jenisSampah: 'Kertas',
        berat: 2.0,
        pendapatan: "Rp.75.0000",
        tanggal: '2023-07-24'),
    LogTransaksi(
        nama: 'Ramdhan Syaifulloh',
        jenisSampah: 'Kaca',
        berat: 1.2,
        pendapatan: "Rp.75.0000",
        tanggal: '2023-07-23'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Transaksi Sampah'),
      ),
      body: ListView.builder(
        itemCount: _logTransaksi.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(_logTransaksi[index].nama),
              subtitle: Text(
                  'Jenis Sampah: ${_logTransaksi[index].jenisSampah}\nBerat: ${_logTransaksi[index].berat}kg\nPendapatan ${_logTransaksi[index].pendapatan} \nTanggal: ${_logTransaksi[index].tanggal}'),
            ),
          );
        },
      ),
    );
  }
}

class LogTransaksi {
  String nama;
  String jenisSampah;
  double berat;
  String pendapatan;
  String tanggal;

  LogTransaksi(
      {required this.nama,
      required this.jenisSampah,
      required this.berat,
      required this.pendapatan,
      required this.tanggal});
}
