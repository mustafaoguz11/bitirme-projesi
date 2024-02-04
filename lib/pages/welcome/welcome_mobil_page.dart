import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeMobilePage extends StatelessWidget {
  const WelcomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Arka plan rengi
      body: Center(
        
        child: Column(
          mainAxisSize: MainAxisSize.min, // ANA YON BOYUTU ASSAGI
          children: [
            Image.asset(
              'assets/images/aktivitelogo.png',
              width: 1550, // Resmin genişliği
              height: 320, // Resmin yüksekliği
            ),
            Text(
              "Artık Aktivite Bulmak Daha Kolay!",
              style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
              ),
            ),
             Text(
              "Haydi Sen de Katıl Bize",
              style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 144, 221, 120),
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(bottom: 180),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // ORTALAYAMA YARIYOR LOGIN VE REGISTER
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 158, 158, 145),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 10),
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.login_rounded,
                          color: Color.fromARGB(255, 144, 221, 120),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 158, 158, 145),
                    )),
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_box,
                          color: Color.fromARGB(255, 139, 214, 116),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Register",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
