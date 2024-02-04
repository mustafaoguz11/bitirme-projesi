import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details/details_page.dart';
import 'package:flutter_application_1/widgets/activityItem/activityItem.dart';
import 'package:google_fonts/google_fonts.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 255, 0), title: Text(
          "Spor Etkinlikleri",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 148, 155, 161),
                Color.fromARGB(255, 60, 255, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        child: Center(
          child: Column(
            children: [
              ActivityItem(
                title: 'Paintball Maçı',
                description: 'Paintball maçı için 3 kişi arıyoruz',
                date: '12 Haziran 2023 - 15:00',
                location: 'Paintball Arena',
                contact: 'İletişim: 555-555-5555',
                payment: 'Ücretli',
                imageAsset: 'assets/images/paintball.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Paintball Maçı',
                        description: 'Paintball maçı için 3 kişi arıyoruz',
                        date: '12 Haziran 2023 - 15:00',
                        location: 'Paintball Arena',
                        contact: 'İletişim: 555-555-5555',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/paintball.png',
                      ),
                    ),
                  );
                },
              ),
              ActivityItem(
                title: 'Basketbol Maçı',
                description: 'Basketbol Maçı İçin 2 Kişi Arıyoruz.',
                date: '23 Haziran 2023 - 22:30',
                location: 'İstanbul',
                contact: 'İletişim: 555-123-4567',
                payment: 'Ücretli',
                imageAsset: 'assets/images/basket.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Basketbol Maçı',
                        description: 'Basketbol Maçı İçin 2 Kişi Arıyoruz.',
                        date: '23 Haziran 2023 - 22:30',
                        location: 'İstanbul',
                        contact: 'İletişim: 555-123-4567',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/basket.jpg',
                      ),
                    ),
                  );
                },
              ),
              ActivityItem(
                title: 'Halısaha Maçı',
                description: 'Halı Saha Maçına 3 Kişi Arıyoruz',
                date: '13 Haziran 2023 - 14:30',
                location: 'İstanbul Bağcılar',
                contact: 'İletişim: 555-123-4567',
                payment: 'Ücretli',
                imageAsset: 'assets/images/asd.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Halısaha Maçı',
                        description: 'Halı Saha Maçına 3 Kişi Arıyoruz',
                        date: '13 Haziran 2023 - 14:30',
                        location: 'İstanbul Bağcılar',
                        contact: 'İletişim: 555-123-4567',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/asd.jpg',
                      ),
                    ),
                  );
                },
              ),
              // Dilediğin kadar ActivityItem ekleyebilirsin
            ],
          ),
        ),
      ),
      ),
    );
  }
}
