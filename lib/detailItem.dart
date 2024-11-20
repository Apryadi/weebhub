import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String itemTitle;
  final String itemDescription;

  const DetailPage({super.key, required this.itemTitle, required this.itemDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Membungkus gambar dengan widget Center untuk menempatkannya di tengah
            Center(
              child: Image.asset(
                'images/hutaoLamp.jpg',
                height: 300,
                fit: BoxFit.cover, // Menjaga aspek rasio gambar tetap terjaga
              ),
            ),
            const SizedBox(height: 16),
            Text(itemTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(itemDescription),
            const SizedBox(height: 20,),
            Text(
              'Rp.290.000',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
