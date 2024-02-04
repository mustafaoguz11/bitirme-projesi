import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateProfileTabletPage extends HookConsumerWidget {
  const UpdateProfileTabletPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final PlatformFile image;
    Future pickImage() async {
      try {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        image = result.files.first;
        return image;
      } on PlatformException catch (e) {
        log('Failed to pick image: $e');
      }
    }

    final displayName = ref.watch(displayNameController);
    final phoneNumber = ref.watch(phoneNumberController);
    final githubUrl = ref.watch(githubUrlController);
    final linkedInUrl = ref.watch(linkedInController);
    final twitterUrl = ref.watch(twitterController);
    final instagramUrl = ref.watch(instagramController);

    final auth = ref.watch(authService);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 144, 221, 120),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Profili Güncelle",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Text(
                  "Profil Fotoğrafı:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                MaterialButton(
                  color: Color.fromARGB(255, 85, 119, 76),
                  child: const Text('Galeriden Fotoğraf Seç',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    pickImage();
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  "İsim:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: displayName,
                    decoration: InputDecoration(
                      hintText: "İsminizi Girin...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Cep Telefonu:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child: TextField(
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      hintText: "Numaranızı Giriniz...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Github Linki:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: githubUrl,
                    decoration: InputDecoration(
                      hintText: "Github linkini girin...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "LinkedIn Linki:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: linkedInUrl,
                    decoration: InputDecoration(
                      hintText: "LinkedIn linkini giriniz...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Twitter Linki:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: twitterUrl,
                    decoration: InputDecoration(
                      hintText: "Twitter linkini giriniz...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Instagram Linki:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: instagramUrl,
                    decoration: InputDecoration(
                      hintText: "Instagram linkini giriniz...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 144, 221, 120),
                                ),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 10)),
                      ),
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        final imageUrl =
                            await auth.uploadImage(pickedFile: image);
                        await auth.updateUserName(
                            userDisplayName: displayName.text);
                        await auth.updateProfile(
                          imageUrl: imageUrl,
                          twitterUrl: twitterUrl.text,
                          userDisplayName: displayName.text,
                          instagramUrl: instagramUrl.text,
                          githubUrl: githubUrl.text,
                          linkedInUrl: linkedInUrl.text,
                          phone: phoneNumber.text,
                        );
                        navigator.pushNamedAndRemoveUntil(
                          '/profile',
                          (_) => false,
                        );
                      },
                      child: Text(
                        "Save",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
