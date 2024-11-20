import 'package:flutter/material.dart';
import 'package:weebhub/detailItem.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF8B4513), // Warna merah kecokelatan
          foregroundColor: Colors.white, // Warna teks dan ikon di AppBar
        ),
        scaffoldBackgroundColor: const Color(0xFFFFE4C4), // Latar belakang halaman
        cardColor: const Color(0xFFDEB887), // Warna kartu
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF5E3B25)), // Warna teks besar
          bodyMedium: TextStyle(color: Color(0xFF5E3B25)), // Warna teks medium
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              print('Menu Button');
            },
            icon: const Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
          ),
          title: const Text('Weeb Hub : Home'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                print('Search button');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('Filter button');
              },
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2, // 2 kolom dalam grid
          padding: const EdgeInsets.all(16),
          childAspectRatio: 2 / 3, // Menyesuaikan proporsi untuk tampilan grid 2 x 3
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      itemTitle: 'Hu Tao Lamp',
                      itemDescription:
                          'Hu Tao Ghost Night Lamp (15x14cm) - Genshin Impact',
                    ),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16.0 / 9.0, // Menyesuaikan proporsi gambar
                      child: Image.asset(
                        'images/hutaoLamp.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Hu Tao Lamp'),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Hu Tao Ghost Night Lamp (15x14cm) - Genshin Impact',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
