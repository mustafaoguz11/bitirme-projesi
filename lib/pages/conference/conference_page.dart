import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details/details_page.dart';
import 'package:flutter_application_1/widgets/activityItem/activityItem.dart';
import 'package:google_fonts/google_fonts.dart';

class ConferencePage extends StatelessWidget {
  const ConferencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 60, 255, 0), title: Text(
          "Konferanslar",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),),
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
                title: 'Yapay Zeka Konferansı',
                description: 'Toplu Yapay Zeka Konferansına Gidiyoruz',
                date: '23 Haziran 2024 - 13:30',
                location: 'İstinye Üniversitesi',
                contact: 'İletişim: 555-123-4567',
                payment: 'Ücretli',
                imageAsset: 'assets/images/konferans-1.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Yapay Zeka Konferansı',
                        description: 'Toplu Yapay Zeka Konferansına Gidiyoruz',
                        date: '23 Haziran 2024 - 13:30',
                        location: 'İstinye Üniversitesi',
                        contact: 'İletişim: 555-123-4567',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/konferans-1.jpg',
                      ),
                    ),
                  );
                },
              ),
              ActivityItem(
                title: 'Yapay Zeka Konferansı',
                description: 'Toplu Yapay Zeka Konferansına Gidiyoruz',
                date: '23 Haziran 2024 - 13:30',
                location: 'İstinye Üniversitesi',
                contact: 'İletişim: 555-123-4567',
                payment: 'Ücretli',
                imageAsset: 'assets/images/konferans-1.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Yapay Zeka Konferansı',
                        description: 'Toplu Yapay Zeka Konferansına Gidiyoruz',
                        date: '23 Haziran 2024 - 13:30',
                        location: 'İstinye Üniversitesi',
                        contact: 'İletişim: 555-123-4567',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/konferans-2.jpg',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
