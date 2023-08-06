import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/providers/jenis_sampah_provider.dart';
import 'package:itrash_skripsi/theme.dart';
import 'package:provider/provider.dart';

class TransaksiSampahForm extends StatefulWidget {
  final String token;
  const TransaksiSampahForm(
    this.token, {
    super.key,
  });

  @override
  _TransaksiSampahFormState createState() => _TransaksiSampahFormState();
}

class _TransaksiSampahFormState extends State<TransaksiSampahForm> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? dropdownvalue;
  TextEditingController beratController = TextEditingController(text: '');

  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() {
    Provider.of<JenisSampahProvider>(context, listen: false).getSampah();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<JenisSampah> jenisSampahData =
        Provider.of<JenisSampahProvider>(context).jenisSampahs.toList();
    //submit form logic
    handleSubmitTransaction() async {
      setState(() {
        isLoading = true;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Center(
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
              const Text("Pilih Jenis Sampah"),
              DropdownButton(
                isExpanded: true,
                hint: const Text("Pilih jenis sampah"),
                items: jenisSampahData.map((e) {
                  return DropdownMenuItem(
                    value: e.id.toString(),
                    child: Text(e.namaSampah.toString()),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  setState(() {
                    dropdownvalue = newVal!;
                  });
                },
                value: dropdownvalue,
              ),
              Text(dropdownvalue!),
              const SizedBox(height: 16),
              TextFormField(
                controller: beratController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Berat (kg)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Berat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    handleSubmitTransaction();
                    // _formKey.currentState!.save();
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _submitForm() {

  //     // Simpan data transaksi ke dalam database atau lakukan tindakan lain sesuai dengan kebutuhan
  //   }
  // }
}
