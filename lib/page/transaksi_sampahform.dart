import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/providers/jenis_sampah_provider.dart';
import 'package:itrash_skripsi/providers/transaksi_provider.dart';
import 'package:itrash_skripsi/theme.dart';
import 'package:provider/provider.dart';

class TransaksiSampahForm extends StatefulWidget {
  final User user;

  const TransaksiSampahForm(this.user, {super.key});
  @override
  State<TransaksiSampahForm> createState() => _TransaksiSampahFormState();
}

class _TransaksiSampahFormState extends State<TransaksiSampahForm> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String? dropdownvalue;
  TextEditingController beratController = TextEditingController();

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

    TransaksiProvider transaksiProvider =
        Provider.of<TransaksiProvider>(context);
    //submit form logic
    handleSubmitTransaction() async {
      setState(() {
        isLoading = true;
      });

      var beratController2 = beratController.text.toString();
      int berat = int.parse(beratController2);

      var idSampahs = dropdownvalue;
      int idSampah = int.parse(idSampahs.toString());

      var token = widget.user.token;

      await transaksiProvider.submitTransaksi(token!, idSampah, berat);

      // await transaksiProvider
      //     .submitTransaksi(token!, idSampah, berat)
      //     .then((value) {
      //   if () {

      AlertDialog alert = AlertDialog(
        title: const Text("Transaksi Sampah Berhasil!"),
        content: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text("Berhasil, silahkan cek transaksi anda"),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            child: Text(
              'Ok',
              style: primaryTextStyleWht,
            ),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false),
          ),
        ],
      );
      //   } else {
      //     throw Exception("gagal submit transaksi");
      //   }
      showDialog(context: context, builder: (context) => alert);
      setState(() {
        isLoading = false;
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
