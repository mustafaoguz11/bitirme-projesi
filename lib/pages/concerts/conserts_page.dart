import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details/details_page.dart';
import 'package:flutter_application_1/widgets/activityItem/activityItem.dart';
import 'package:google_fonts/google_fonts.dart';

class ConsertsPage extends StatelessWidget {
  const ConsertsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 60, 255, 0), title: Text(
          "Konserler",
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
                title: 'Hayko Cepkin Konseri',
                description: 'Toplu Hayko Cepkin Konserine Gidiyoruz',
                date: '23 Haziran 2024 - 18:30',
                location: 'Beşiktaş Stadyum',
                contact: 'İletişim: 555-123-4567',
                payment: 'Ücretli',
                imageAsset: 'assets/images/hayko.jpg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'Hayko Cepkin Konseri',
                        description: 'Toplu Hayko Cepkin Konserine Gidiyoruz',
                        date: '23 Haziran 2024 - 18:30',
                        location: 'Beşiktaş Stadyum',
                        contact: 'İletişim: 555-123-4567',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/hayko.jpg',
                      ),
                    ),
                  );
                },
              ),
              ActivityItem(
                title: 'İrem Derici',
                description: 'Toplu İrem Derici Konserine Gidiyoruz',
                date: '12 Haziran 2023 - 15:00',
                location: 'Konser Sahası',
                contact: 'İletişim: 555-555-5555',
                payment: 'Ücretli',
                imageAsset: 'assets/images/irem.webp',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivityDetailsPage(
                        title: 'İrem Derici',
                        description: 'Toplu İrem Derici Konserine Gidiyoruz',
                        date: '12 Haziran 2023 - 15:00',
                        location: 'Konser Sahası',
                        contact: 'İletişim: 555-555-5555',
                        payment: 'Ücretli',
                        imageAsset: 'assets/images/irem.webp',
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
