import 'package:flutter/material.dart';

class TransaksiSampah extends StatefulWidget {
  final String token;

  const TransaksiSampah(this.token, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransaksiSampahState createState() => _TransaksiSampahState();
}

class _TransaksiSampahState extends State<TransaksiSampah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaksi Sampah'),
      ),
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('contoh'),
              subtitle: Text('Jenis Sampah: '),
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
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
