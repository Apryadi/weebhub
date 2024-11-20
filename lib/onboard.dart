import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weebhub/login.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _pageController = PageController(); // Controller untuk PageView
  int _currentPage = 0; // Menyimpan halaman saat ini

  // Warna tema merah kecokelatan
  final Color themeColor = const Color(0xFF8B4513);
  final Color secondaryColor = const Color(0xFFD2691E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F5), // Latar belakang lembut
      body: SafeArea(
        child: Column(
          children: [
            // Bagian untuk konten
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    // Halaman pertama
                    _buildOnboardPage(
                      'assets/animated-2.json',
                      'Find Something That Suits You',
                      'Fill Your Room with Anime Collections And Merch',
                    ),
                    // Halaman kedua
                    _buildOnboardPage(
                      'assets/gojoCat.json',
                      'Be Who You Are',
                      'Who said Weeb cant have Style',
                    ),
                    // Halaman ketiga
                    _buildOnboardPage(
                      'assets/gojoCat.json',
                      'Get Started Now',
                      'Start your journey with us today',
                    ),
                  ],
                ),
              ),
            ),

            // Bagian tombol navigasi
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Previous
                  if (_currentPage > 0)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor, // Warna merah kecokelatan
                        foregroundColor: Colors.white, // Warna teks terang
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text('Previous'),
                    ),
                  // Tombol Next
                  if (_currentPage < 2)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor, // Warna merah kecokelatan
                        foregroundColor: Colors.white, // Warna teks terang
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      child: const Text('Next'),
                    ),
                  // Tombol Get Started (untuk halaman terakhir)
                  if (_currentPage == 2)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondaryColor, // Warna aksen merah kecokelatan
                        foregroundColor: Colors.white, // Warna teks terang
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text('Get Started'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun setiap halaman onboard
  Widget _buildOnboardPage(String asset, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            asset,
            width: 330,
            height: 300,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: themeColor, // Warna judul merah kecokelatan
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
