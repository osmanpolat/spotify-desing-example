import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpotiftySearchScreen extends StatelessWidget {
  const SpotiftySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopBar(),
                const SizedBox(height: 20),
                _buildSearchBox(),
                const SizedBox(height: 30),
                _buildSectionTitle("Göz atmaya başla"),
                const SizedBox(height: 12),
                _buildCategoryGrid(),
                const SizedBox(height: 24),
                _buildSectionTitle("Müzik türlerini keşfet"),
                const SizedBox(height: 12),
                _buildMusicScroll(),
                const SizedBox(height: 24),
                _buildSectionTitle("Tümüne göz at"),
                _buildCategoryGrid(bottomSet: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTopBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/spotify-user.png',
            ), // Örnek kullanıcı görseli
            radius: 20,
          ),
          const SizedBox(width: 20),
          Text(
            'Ara',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      const Row(
        children: [
          Icon(Icons.mic, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.camera_alt, color: Colors.white),
        ],
      ),
    ],
  );
}

Widget _buildSearchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(8),
    ),
    child: const TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        icon: Icon(Icons.search, color: Colors.white),
        hintText: 'Ne dinlemek istiyorsun?',
        hintStyle: TextStyle(color: Colors.white54),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget _buildSectionTitle(String title) {
  return Text(
    title,
    style: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );
}

Widget _buildCategoryGrid({bool bottomSet = false}) {
  final List<Map<String, dynamic>> items =
      bottomSet
          ? [
            {'title': 'Keşfet', 'color': Colors.purple},
            {'title': 'Senin için hazırlandı', 'color': Colors.blue},
            {'title': 'Son müzik trendleri', 'color': Colors.blue[900]},
            {'title': 'Güncel haberler', 'color': Colors.brown},
          ]
          : [
            {'title': 'Müzik', 'color': Colors.deepPurple},
            {'title': 'Podcast\'ler', 'color': Colors.red},
            {'title': 'Listeler', 'color': Colors.blue},
            {'title': 'Canlı Etkinlikler', 'color': Colors.pink},
          ];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: items.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2.8,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemBuilder: (context, index) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: items[index]['color'] as Color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            items[index]['title']!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildMusicScroll() {
  final List<Map<String, String>> musicGenres = [
    {'image': 'assets/images/pop.png', 'title': '#Pop'},
    {'image': 'assets/images/indie-pop.jpg', 'title': '#Indie-Pop'},
    {'image': 'assets/images/rnb.jpg', 'title': '#R&B'},
  ];

  return SizedBox(
    height: 180,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: musicGenres.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(musicGenres[index]['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  musicGenres[index]['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
