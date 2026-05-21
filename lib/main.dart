import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biodata"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(20),

          child: Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  "Nur Faidah Rahmah",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 10),
                    Text("nurfaidahrahmah9f@gmail.com"),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 10),
                    Text("082261700980"),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}