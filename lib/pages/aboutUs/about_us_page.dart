import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facebookUrl = Uri.parse('https://facebook.com/');
    final instagramUrl = Uri.parse('https://instagram.com/');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 255, 0),
       title: Text(
          "Hakkımızda",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ), 
      
      body: SafeArea(
         child: Container(
          padding: const EdgeInsets.all(65.0),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/aktivitelogo.png', // İlgili resmi ekleyin
                  width: 190,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Biz Kimiz?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'AktiviteBul #EğlenceniSeç! AktiviteBul, eğlence dünyasına ulaşmanın en kolay yolu! Biz, keyifli zaman geçirmek isteyenleri bir araya getiren, konserlerden etkinliklere, spor müsabakalarından festivallere kadar geniş bir yelpazede aktiviteler sunan bir mobil uygulama platformuyuz.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Sosyal Medya Hesaplarımız',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                      textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SocialMediaIcon(
                            icon: Icons.facebook,
                            onTap: () {
                              launchUrl(facebookUrl,
                                  mode: LaunchMode.externalApplication);
                            },
                          ),
                          const Text(
                            'Facebook',
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      
                      Column(
                        children: [
                          SocialMediaIcon(
                            icon: Icons.photo_camera,
                            onTap: () {
                              launchUrl(instagramUrl,
                                  mode: LaunchMode.externalApplication);
                            },
                          ),
                          const Text(
                            'İnstagram',
                          ),
                        ],
                      ),
                    ],
                  ),
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

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialMediaIcon({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        radius: 20,
        child: Icon(
          icon,
          color: Color.fromARGB(255, 60, 255, 0),
        ),
      ),
    );
  }
}
