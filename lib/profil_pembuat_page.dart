import 'package:flutter/material.dart';

class ProfilPembuatPage extends StatelessWidget {
  const ProfilPembuatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pembuat'),
        backgroundColor: Colors.green,
        elevation: 0, // Remove shadow
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Use a Container to wrap the CircleAvatar
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://elearning.itg.ac.id/upload/avatar/1644073789IMG20220205220315.jpg'), // URL gambar
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Chandra Pratama',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Institut Teknologi Garut',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}