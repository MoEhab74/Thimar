import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Add your widgets here
            Align(
              alignment: Alignment.centerRight,
              child: const Text(
                'الأقسام',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 135,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Example item count
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18.0),
                        width: 100,
                        margin: const EdgeInsets.only(left: 8.0),
                        color: Colors.green[100 * ((index % 8) + 1)],
                        child: Center(
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
                            height: 40,
                            width: 40,
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Category ${index + 1}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
