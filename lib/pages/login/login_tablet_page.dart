import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginTabletPage extends HookConsumerWidget {
  const LoginTabletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailController);
    final password = ref.watch(passwordController);
    final auth = ref.watch(authService);
    return Scaffold(
       appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 60, 255, 0),
        title: Text(
          "Giriş Yap",
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "E-Mail :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
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
                    decoration: InputDecoration(
                      hintText: "Enter Your Email...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Şifre :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
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
                      hintText: "Şifrenizi Girin...",
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
                            const TextStyle(fontSize: 15)),
                      ),
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        await auth.login(
                          email: email.text,
                          password: password.text,
                        );
                        navigator.pushNamedAndRemoveUntil(
                          '/home',
                          (_) => false,
                        );
                      },
                      child: Text(
                        "Giriş Yap",
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
    );
  }
}
