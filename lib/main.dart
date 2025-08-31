import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery Dark',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0C0C0F),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const GalleryPage(),
    );
  }
}

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});
  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> imagePaths = const [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
  ];


  PreferredSizeWidget _gradientAppBar() {
    return AppBar(
      title: const Text('Gallery Page'),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B0E2B), Color(0xFF0C0C0F)],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _gradientAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0C0C0F), Color(0xFF14121A), Color(0xFF0C0C0F)],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          itemCount: imagePaths.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0x1AFFFFFF),
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.white.withOpacity(0.18)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                        child: Image.asset(
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Image ${index + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            favorites[index]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favorites[index]
                                ? const Color(0xFFFF6B81)
                                : Colors.white70,
                          ),
                          onPressed: () => setState(
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}