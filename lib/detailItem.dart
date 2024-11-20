import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemTitle;
  final String itemDescription;

  const DetailPage({
    super.key,
    required this.itemTitle,
    required this.itemDescription,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF8B4513), // Warna merah kecokelatan untuk AppBar
          foregroundColor: Colors.white, // Warna teks dan ikon di AppBar
        ),
        scaffoldBackgroundColor: const Color(0xFFFFE4C4), // Latar belakang halaman
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Color(0xFF5E3B25), // Warna teks judul besar
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF5E3B25), // Warna teks utama
            fontSize: 16,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Kembali ke halaman sebelumnya (Homepage)
            },
          ),
          title: Text(itemTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/hutaoLamp.jpg',
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(itemTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(
                itemDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Rp.290.000',
                style: const TextStyle(
                  fontSize: 28,
                  color: Color(0xFF8B4513), // Warna harga yang konsisten
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
