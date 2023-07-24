import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransaksiSampah(),
    );
  }
}

class TransaksiSampah extends StatefulWidget {
  const TransaksiSampah({super.key});

  @override
  _TransaksiSampahState createState() => _TransaksiSampahState();
}

class _TransaksiSampahState extends State<TransaksiSampah> {
  final List<Transaksi> _listTransaksi = [
    Transaksi(nama: 'Ramdhan Syaifulloh', jenisSampah: 'Plastik', berat: 3.5),
    Transaksi(nama: 'Ramdhan Syaifulloh', jenisSampah: 'Kertas', berat: 2.0),
    Transaksi(nama: 'Ramdhan Syaifulloh', jenisSampah: 'Kaca', berat: 1.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi Sampah'),
      ),
      body: ListView.builder(
        itemCount: _listTransaksi.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(_listTransaksi[index].nama),
              subtitle: Text(
                  'Jenis Sampah: ${_listTransaksi[index].jenisSampah}\nBerat: ${_listTransaksi[index].berat} kg'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman tambah transaksi (opsional)
        },
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/form-transaksi');
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class Transaksi {
  String nama;
  String jenisSampah;
  double berat;

  Transaksi(
      {required this.nama, required this.jenisSampah, required this.berat});
}
