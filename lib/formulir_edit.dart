import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'models/stok.dart';

class EditStokForm extends StatefulWidget {
  final Stok stok;

  EditStokForm({required this.stok});

  @override
  _EditStokFormState createState() => _EditStokFormState();
}

class _EditStokFormState extends State<EditStokForm> {
  final _formKey = GlobalKey<FormState>();
  late String _nama;
  late int _kuantitas;
  late String _atribut;
  late double _berat;

  @override
  void initState() {
    super.initState();
    _nama = widget.stok.name;
    _kuantitas = widget.stok.qty;
    _atribut = widget.stok.attr;
    _berat = widget.stok.weight;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Stok updatedStok = Stok(
        id: widget.stok.id,
        name: _nama,
        qty: _kuantitas,
        attr: _atribut,
        weight: _berat,
        createdAt: widget.stok.createdAt,
        updatedAt: DateTime.now(),
      );

      String apiUrl = 'https://api.kartel.dev/stocks/${widget.stok.id}';

      try {
        print('Data dikirim: ${updatedStok.toJson()}');

        var response = await Dio().put(
          apiUrl,
          data: updatedStok.toJson(),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        if (response.statusCode == 200 || response.statusCode == 204) {
          Navigator.pop(context, true);
        } else if (response.statusCode == 422) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal memperbarui : ${response.data}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Gagal memperbarui : ${response.statusMessage}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Terjadi kesalahan: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Stok'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _nama,
                decoration: InputDecoration(labelText: 'Nama'),
                onSaved: (value) {
                  _nama = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _kuantitas.toString(),
                decoration: InputDecoration(labelText: 'Kuantitas'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _kuantitas = int.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Quantity cannot be empty';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Quantity must be a number';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _atribut,
                decoration: InputDecoration(labelText: 'Atribut'),
                onSaved: (value) {
                  _atribut = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Attributes cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _berat.toString(),
                decoration: InputDecoration(labelText: 'Berat'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSaved: (value) {
                  _berat = double.parse(value!);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'The weight cannot be empty';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Weight must be a number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}