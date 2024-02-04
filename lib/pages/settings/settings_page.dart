import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_application_1/widgets/settingsItem.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authService);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 60, 255, 0),
         title: Text(
          "Ayarlar",
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
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                SettingItems(
                  title: "Profil Ayarları",
                  onTap: () {
                    Navigator.pushNamed(context, '/update-profile');
                  },
                ),
                SettingItems(
                  title: "Bildirimleri Ayarla",
                  onTap: () {},
                ),
                SettingItems(
                  title: "Bizimle İletisime Gecin",
                  onTap: () {
                    Navigator.pushNamed(context, "/communication");
                  },
                ),
                SettingItems(
                  
                  title: "Etkinlik Önerileriniz",
                  onTap: () {},
                ),
                SettingItems(
                  title: "Hesabımı Devre Dışı Bırak",
                  onTap: () async {
                    await auth.removeUser();
                    await auth.logout();
                  },
                ),
                const SizedBox(height: 265),
              ],
            ),
          ),
        ), ), );
  }
}
