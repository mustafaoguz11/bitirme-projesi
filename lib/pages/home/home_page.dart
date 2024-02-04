import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details/details_page.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/widgets/activityItem/activityItem.dart';
import 'package:flutter_application_1/widgets/menuItem.dart';
import 'package:flutter_application_1/widgets/storyItem.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../widgets/profileItem.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authService);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 60, 255, 0),
        title: Text(
          "Aktivite Bul",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 148, 155, 161),
                Color.fromARGB(255, 60, 255, 0),
              ],
            ),
          ),
          child: Column(
            children: [
              ref.watch(profileImageProvider).when(
                    error: (error, stackTrace) => const SizedBox(),
                    loading: () => const CircularProgressIndicator(),
                    data: (userInfo) {
                      final image = userInfo['imageUrl'];
                      return ProfileItem(
                        avatar: CircleAvatar(
                          radius: 40,
                          backgroundImage: image != null
                              ? NetworkImage(image)
                              : const AssetImage("assets/images/appicon.jpg")
                                  as ImageProvider,
                        ),
                        name: userInfo['userDisplayName'] ?? 'None',
                        onTap: () => Navigator.pushNamed(context, "/profile"),
                      );
                    },
                  ),
              const Divider(),
              Expanded(
                child: Column(
                  children: [
                    MenuItem(
                      title: "Ana Ekran",
                      icon: const Icon(
                        Icons.house,
                        size: 30,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/home");
                      },
                    ),
                    MenuItem(
                      title: "Etkinlikler",
                      icon: const Icon(
                        Icons.local_activity,
                        size: 30,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/activity");
                      },
                    ),
                    MenuItem(
                      title: "Hakkımızda",
                      icon: const Icon(
                        Icons.info_outline,
                        size: 30,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/aboutus");
                      },
                    ),
                    MenuItem(
                      title: "Iletişim",
                      icon: const Icon(
                        Icons.mail,
                        size: 30,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/communication");
                      },
                    ),
                    MenuItem(
                      title: "Ayarlar",
                      icon: const Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/settings");
                      },
                    ),
                  ],
                ),
              ),
              MenuItem(
                icon: const Icon(
                  Icons.logout_outlined,
                  size: 30,
                  color: Colors.white,
                ),
                onTap: () async {
                  final navigator = Navigator.of(context);
                  await auth.logout();
                  navigator.pushNamedAndRemoveUntil(
                      "/welcome", (route) => false);
                },
                title: "Çıkış Yap",
              ),
              const SizedBox(height: 30),
              const Text(
                "Version 1.0.5",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
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
            child: Center(
              child: Column(
                children: [
               
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        StoryItem("Konser", Icons.music_note, () {
                          Navigator.pushNamed(context, '/konser');
                        }),
                        StoryItem("Festival", Icons.star, () {
                          Navigator.pushNamed(context, '/festival');
                        }),
                        StoryItem1("Spor Müsabakaları", Icons.directions_run,
                            () {
                          Navigator.pushNamed(context, '/spor');
                        }),
                        StoryItem2(
                            "Konferans", Icons.confirmation_number_rounded, () {
                          Navigator.pushNamed(context, '/konferans');
                        }),
                        StoryItem2("Etkinlikler", Icons.event, () {
                          Navigator.pushNamed(context, "/activity");
                        }),
                        StoryItem2("Yarışmalar", Icons.emoji_events, () {
                          Navigator.pushNamed(context, '/yarismalar');
                        }),
                      ],
                    ),
                  ),
                  searchbox(),
                   Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Konserler',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            
                            fontSize: 19,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child: ActivityItem(
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
                            ),
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child: ActivityItem(
                                title: 'İrem Derici',
                                description:
                                    'Toplu İrem Derici Konserine Gidiyoruz',
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
                            ),
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child:ActivityItem(
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
                            ),
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child: ActivityItem(
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Etkinlikler',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            
                            fontSize: 19,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child: ActivityItem(
                                title: 'Paintball Maçı',
                                description:
                                    'Paintball maçı için 3 kişi arıyoruz',
                                date: '12 Aralık 2023 - 15:00',
                                location: 'Paintball Arena',
                                contact: 'İletişim: 555-555-5555',
                                payment: 'Ücretli',
                                imageAsset: 'assets/images/paintball.png',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ActivityDetailsPage(
                                        title: 'Paintball Maçı',
                                        description:
                                            'Paintball maçı için 3 kişi arıyoruz',
                                        date: '12 Aralık 2023 - 15:00',
                                        location: 'Paintball Arena',
                                        contact: 'İletişim: 555-555-5555',
                                        payment: 'Ücretli',
                                        imageAsset:
                                            'assets/images/paintball.png',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child: ActivityItem(
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
                            ),
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child: ActivityItem(
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
                                      builder: (context) =>
                                          const ActivityDetailsPage(
                                        title: 'Halısaha Maçı',
                                        description:
                                            'Halı Saha Maçına 3 Kişi Arıyoruz',
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
                            ),
                            Container(
                              width: 350,
                              margin: const EdgeInsets.all(8.0),
                              child: ActivityItem(
                                title: 'Basketbol Maçı',
                                description:
                                    'Basketbol Maçı İçin 2 Kişi Arıyoruz.',
                                date: '23 Haziran 2023 - 22:30',
                                location: 'İstanbul',
                                contact: 'İletişim: 555-123-4567',
                                payment: 'Ücretli',
                                imageAsset: 'assets/images/basket.jpg',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ActivityDetailsPage(
                                        title: 'Basketbol Maçı',
                                        description:
                                            'Basketbol Maçı İçin 2 Kişi Arıyoruz.',
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchbox() => Container(
        height: 50,
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(15, 170, 170, 170),
            ),
            borderRadius: BorderRadius.circular(25)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.search, size: 22, color: Colors.grey),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Etkinlik Ara",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Icon(Icons.tune, size: 18, color: Color.fromRGBO(236, 125, 87, 1))
          ],
        ),
      );
}
