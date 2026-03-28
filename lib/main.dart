import 'package:flutter/material.dart';

void main() {
  runApp(const PraktikumApp());
}

class PraktikumApp extends StatelessWidget {
  const PraktikumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2 Praktikum',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PraktikumPage(),
    );
  }
}

class PraktikumPage extends StatefulWidget {
  const PraktikumPage({super.key});

  @override
  State<PraktikumPage> createState() => _PraktikumPageState();
}

class _PraktikumPageState extends State<PraktikumPage> {
  bool _showImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Praktikum Tugas 2"),
      ),
      body: Column(
        children: [
          // SCROLL TEXT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Ini adalah contoh teks panjang untuk praktikum Flutter.\n\n"
                "Kamu bisa menambahkan cerita tentang daerahmu di sini.\n\n"
                "Contoh:\n"
                "Medan terkenal dengan kopi khasnya yang memiliki cita rasa kuat.\n\n"
                "Tambahkan teks panjang lagi agar bisa discroll...",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // IMAGE / CONTAINER
          Container(
            height: 200,
            width: double.infinity,
            color: _showImage ? Colors.transparent : Colors.grey[300],
            child: _showImage
                ? Image.asset(
                    'assets/kopi.jpg',
                    fit: BoxFit.contain,
                  )
                : const Center(
                    child: Text(
                      "Warna Background",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
          ),

          const SizedBox(height: 10),

          // BUTTON
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showImage = !_showImage;
                  });
                },
                child: Text(
                  _showImage ? "Kembali ke Warna" : "Tampilkan Gambar",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Tombol lain ditekan!"),
                    ),
                  );
                },
                child: const Text("Tombol Lain"),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}