import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MnwzNTg2Mzd8MHwxfHNlYXJjaHw0fHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHx8fDE2NjE0NDMwODI&ixlib=rb-1.2.1'),
              ),

              // Heading
              Text(
                "Some Guy idk",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Subheading
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('HE DO BE CODIN THO',
                    style: TextStyle(
                        color: Colors.teal.shade100,
                        fontFamily: 'Source Sans',
                        fontSize: 14,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)),
              ),

              // Divider
              SizedBox(
                width: 80,
                height: 50,
                child: Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),

              // Phone card
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 24,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal.shade500,
                    size: 32,
                  ),
                  title: Text(
                    "508-455-9667",
                    style: TextStyle(
                      fontFamily: 'Source Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Email card
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 24,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal.shade500,
                    size: 32,
                  ),
                  title: Text(
                    "Dariana_Stroman18@gmail.com",
                    style: TextStyle(
                      fontFamily: 'Source Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
