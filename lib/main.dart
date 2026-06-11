import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout Flutter Projectg',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Flights',
      'icon': Icons.flight,
      'colors': [Color(0xFF00C6FF), Color(0xFF0072FF)],
    },

    {
      'title': 'Destinations',
      'icon': Icons.location_on,
      'colors': [Color(0xFFFFD54F), Color(0xFFFFB300)],
    },

    {
      'title': 'Hotels',
      'icon': Icons.hotel,
      'colors': [Color(0xFF11998E), Color(0xFF38EF7D)],
    },

    {
      'title': 'Car Rentals',
      'icon': Icons.directions_car,
      'colors': [Color(0xFFFF5F6D), Color(0xFFFFC371)],
    },

    {
      'title': 'Trains',
      'icon': Icons.train,
      'colors': [Color(0xFF7F7FD5), Color(0xFF86A8E7)],
    },

    {
      'title': 'Culinary',
      'icon': Icons.restaurant,
      'colors': [Color(0xFFFF9966), Color(0xFFFF5E62)],
    },

    {
      'title': 'Insurance',
      'icon': Icons.security,
      'colors': [Color(0xFF00B4DB), Color(0xFF0083B0)],
    },

    {
      'title': 'Coupons',
      'icon': Icons.discount,
      'colors': [Color(0xFF434343), Color(0xFF000000)],
    },

    {
      'title': 'Events',
      'icon': Icons.event,
      'colors': [Color(0xFF56AB2F), Color(0xFFA8E063)],
    },

    {
      'title': 'Todo API',
      'icon': Icons.api,
      'colors': [Color(0xFF673AB7), Color(0xFF512DA8)]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER PROFILE
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const BiodataPage()),
                  );
                },
                child: Container(
                  color: Colors.amber[300],
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 25, child: Icon(Icons.person)),

                      const SizedBox(width: 12),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NUR FAIDAH RAHMAH",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("nurfaidahrahmah9f@gmail.com"),
                          ],
                        ),
                      ),

                      Column(
                        children: const [
                          Text("POINT"),
                          Text(
                            "825",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // PROMO SLIDER
              CarouselSlider(
                options: CarouselOptions(
                  height: 220,
                  autoPlay: true,
                  autoPlayInterval: const Duration(milliseconds: 3500),
                  viewportFraction: 1,
                ),
                items: [

                  promoImage(
                    "assets/promo1.jpg",
                    "GET 20% OFF",
                  ),

                  promoImage(
                    "assets/promo2.jpg",
                    "FLASH SALE",
                  ),

                  promoImage(
                    "assets/promo3.jpg",
                    "BUY 1 GET 1",
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // MENU GRID
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: menuItems.length,

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),

                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    final colors = item['colors'];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {

                            if (item['title'] == 'Todo API') {
                              return const TodoPage();
                            }

                            return CategoryPage(
                              title: item['title'],
                            );
                          },
                          ),
                        );
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),

                          gradient: LinearGradient(
                            colors: colors,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),

                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Icon(
                                item['icon'],
                                size: 35,
                                color: Colors.indigo,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              item['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget promoCard(String text, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static Widget promoImage(
    String imagePath,
    String title,
  ) {

    return Container(
      margin: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.3),
        ),

        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Biodata")),

      body: Center(
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(20),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 40),
                ),

                const SizedBox(height: 15),

                const Text(
                  "NUR FAIDAH RAHMAH",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text("nurfaidahrahmah9f@gmail.com"),

                const Text("082261700980"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String title;

  const CategoryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: Center(
        child: Text(
          "Halaman $title",
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  Future<List<dynamic>> fetchTodos() async {

    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/todos/',
      ),
    );

    if (response.statusCode == 200) {

      return jsonDecode(response.body);

    } else {

      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Todo API"),
      ),

      body: FutureBuilder<List<dynamic>>(

        future: fetchTodos(),

        builder: (context, snapshot) {

          // LOADING
          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // ERROR
          if (snapshot.hasError) {

            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          // DATA
          final todos = snapshot.data!;

          return ListView.builder(

            itemCount: todos.length,

            itemBuilder: (context, index) {

              final todo = todos[index];

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),

                child: ListTile(

                  leading: CircleAvatar(
                    backgroundColor:
                        todo['completed']
                            ? Colors.green
                            : Colors.orange,

                    child: Icon(
                      todo['completed']
                          ? Icons.check
                          : Icons.pending,
                      color: Colors.white,
                    ),
                  ),

                  title: Text(
                    todo['title'],
                  ),

                  subtitle: Text(
                    'Todo ID: ${todo['id']}',
                  ),

                  trailing: Text(
                    todo['completed']
                        ? 'Done'
                        : 'Pending',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
