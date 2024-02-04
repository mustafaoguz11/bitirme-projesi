import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterMobilePage extends HookConsumerWidget {
  const RegisterMobilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authService);
    final email = ref.watch(emailController);
    final password = ref.watch(passwordController);
    final password2 = ref.watch(passwordController2);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 60, 255, 0),
        title: Text(
          "Kayıt Ol",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "E-Posta :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(49, 158, 158, 158),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: email,
                    expands: false,
                    decoration: InputDecoration(
                      hintText: "Enter Your Username...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Şifre :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(49, 158, 158, 158),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "Şifrenizi Giriniz",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Tekrar Şifre :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(49, 158, 158, 158),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "Şifrenizi Tekrar Giriniz...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 60, 255, 0),
                        ),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              fontSize: 15)),
                      ),
                      onPressed: () async {
                        if (password.text == password2.text) {
                          final navigator = Navigator.of(context);
                          await auth.register(
                            email: email.text,
                            password: password.text,
                          );
                          navigator.pushNamedAndRemoveUntil(
                              '/welcome', (Route<dynamic> route) => false);
                        } else {
                          //Şifreler uyuşmuyor mesajı gönder
                        }
                      },
                    child: Text(
                        "Kayıt Ol",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                const SizedBox(height: 175),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
