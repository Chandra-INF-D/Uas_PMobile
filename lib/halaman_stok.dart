import 'package:flutter/material.dart';
import 'tambah_stok.dart';
import 'halaman_lihat.dart';
import 'halaman_edit.dart';

class StokSayaPage extends StatelessWidget {
  const StokSayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock'),
        backgroundColor: Colors.green,
        elevation: 0, // Remove shadow
      ),
      body: SafeArea(
        child: Center( // Center the content within the Scaffold
          child: SingleChildScrollView( // Allow scrolling if content overflows
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimize column size
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24.0),
                        elevation: 4.0,
                        shadowColor: Colors.grey.withOpacity(0.2),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TambahStokPage()),
                        );
                      },
                      child: const Text('Tambah Stok'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24.0),
                        elevation: 4.0,
                        shadowColor: Colors.grey.withOpacity(0.2),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LihatStokPage()),
                        );
                      },
                      child: const Text('Lihat Stok'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24.0),
                    elevation: 4.0,
                    shadowColor: Colors.green.withOpacity(0.2),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditStokPage()),
                    );
                  },
                  child: const Text('Edit Stok'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
