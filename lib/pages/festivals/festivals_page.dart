import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details/details_page.dart';
import 'package:flutter_application_1/widgets/activityItem/activityItem.dart';
import 'package:google_fonts/google_fonts.dart';

class FestivalsPage extends StatelessWidget {
  const FestivalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 255, 0), title: Text(
          "Festival",
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
                title: 'Holi Festivali',
                description: 'Holi Festivaline Toplu Gidiyoruz',
                date: '5 Haziran 2023 - 15:00',
                location: 'İstanbul',
                contact: 'İletişim: 555-555-5555',
                payment: 'Ücretli',
                imageAsset: 'assets/images/festival-1.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Holi Festivali',
                        description: 'Holi Festivaline Toplu Gidiyoruz',
                        date: '5 Haziran 2023 - 15:00',
                        location: 'İstanbul',
                        contact: 'İletişim: 555-555-5555',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/festival-1.jpg',
                      ),
                    ),
                  );
                },
              ),
              ActivityItem(
                title: 'Festival Park 2024',
                description: 'Festival Park 2024 Festivaline Toplu Gidiyoruz',
                date: '23 Haziran 2024 - 12:30',
                location: 'İstanbul',
                contact: 'İletişim: 555-123-4567',
                payment: 'Ücretli',
                imageAsset: 'assets/images/festival-2.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Festival Park 2024',
                        description:
                            'Festival Park 2024 Festivaline Toplu Gidiyoruz',
                        date: '23 Haziran 2024 - 12:30',
                        location: 'İstanbul',
                        contact: 'İletişim: 555-123-4567',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/festival-2.jpeg',
                      ),
                    ),
                  );
                },
              ),
              ActivityItem(
                title: 'Labut 2024',
                description: 'Labut 2024 Festivaline Toplu Gidiyoruz',
                date: '10 Haziran 2024 - 12:30',
                location: 'İstanbul',
                contact: 'İletişim: 555-123-4567',
                payment: 'Ücretsiz',
                imageAsset: 'assets/images/festival-3.jpeg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Labut 2024',
                        description: 'Labut 2024 Festivaline Toplu Gidiyoruz',
                        date: '10 Haziran 2024 - 12:30',
                        location: 'İstanbul',
                        contact: 'İletişim: 555-123-4567',
                        payment: 'Ücretsiz',
                        imageAsset: 'assets/images/festival-3.jpeg',
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
