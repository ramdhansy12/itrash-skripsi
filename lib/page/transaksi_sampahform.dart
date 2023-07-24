import 'package:flutter/material.dart';
import 'package:itrash_skripsi/theme.dart';

class TransaksiSampahForm extends StatefulWidget {
  const TransaksiSampahForm({super.key});

  @override
  _TransaksiSampahFormState createState() => _TransaksiSampahFormState();
}

class _TransaksiSampahFormState extends State<TransaksiSampahForm> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  String _jenisSampah = '';
  double _berat = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Center(
          child: Text('Form Transaksi Sampah'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nama = value!;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Jenis Sampah'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis sampah tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _jenisSampah = value!;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Berat (kg)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Berat tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _berat = double.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Simpan data transaksi ke dalam database atau lakukan tindakan lain sesuai dengan kebutuhan

      // Cetak data sebagai contoh
      // print('Nama: $_nama');
      // print('Jenis Sampah: $_jenisSampah');
      // print('Berat: $_berat kg');
    }
  }
}
