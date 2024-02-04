import 'package:flutter/material.dart';

Widget StoryItem(String name, IconData icon, VoidCallback onTap) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2.5),
              child: Container(
                padding: const EdgeInsets.all(3),
                width: 90, // Genişliği ayarlayarak yuvarlakları daha uzun yapın
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 255, 0),
                  borderRadius: BorderRadius.circular(
                      410), // Dikdörtgenin yarısından küçük olmalı
                ),
                
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 60, 255, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 20,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      const SizedBox(width: 5),
                      
                      Text(
                        name,
                        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}

Widget StoryItem1(String name, IconData icon, VoidCallback onTap) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2.5),
              child: Container(
                padding: const EdgeInsets.all(2),
                width:
                    150, // Genişliği ayarlayarak yuvarlakları daha uzun yapın
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 255, 0),
                  borderRadius: BorderRadius.circular(
                      410), // Dikdörtgenin yarısından küçük olmalı
                ),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 60, 255, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 20,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      const SizedBox(width: 5),
                        Text(
                        name,
                        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}

Widget StoryItem2(String name, IconData icon, VoidCallback onTap) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2.5),
              child: Container(
                padding: const EdgeInsets.all(2),
                width:
                    100, // Genişliği ayarlayarak yuvarlakları daha uzun yapın
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 255, 0),
                  borderRadius: BorderRadius.circular(
                      410), // Dikdörtgenin yarısından küçük olmalı
                ),
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 60, 255, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 20,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        name,
                        style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
