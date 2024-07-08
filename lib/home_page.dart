import 'package:flutter/material.dart';
import 'halaman_stok.dart';
import 'profil_pembuat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) { // Get theme (optional)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Use a common style for both buttons
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.2), // Consistent blue color
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(color: Colors.white, width: 2), // Consistent white border
                ),
                icon: const Icon(Icons.inventory, size: 24), // Consistent white icon
                label: const Text(
                  'Stock',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Consistent white text
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StokSayaPage()),
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.2), // Consistent blue color
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(color: Colors.white, width: 2), // Consistent white border
                ),
                icon: const Icon(Icons.person, size: 24), // Consistent white icon
                label: const Text(
                  'Profil Pembuat',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Consistent white text
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilPembuatPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}