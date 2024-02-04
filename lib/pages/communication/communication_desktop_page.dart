import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommunicationDesktopPage extends HookConsumerWidget {
  const CommunicationDesktopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactName = ref.watch(contactNameController);
    final contactMail = ref.watch(contactMailController);
    final contactMessage = ref.watch(contactMessageController);
    final notifier = ref.read(contactProvider.notifier);
    final contact = ref.watch(contactProvider);
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 107, 207, 73),
       title: Text(
          "İletisim",
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
          padding: const EdgeInsets.all(55.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 53, 54, 54),
                Color.fromARGB(255, 107, 207, 73),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "İletişim Bilgileri",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
               Text(
                  "Ad Soyad :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
               TextField(
                    controller: contactName,
                    decoration: InputDecoration(
                      hintText: "Adınız ve soyadınızı girin",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                Text(
                  "E-posta :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
               TextField(
                   controller: contactMail,
                    decoration: InputDecoration(
                      hintText: "E-posta adresinizi girin",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                Text(
                  "Mesajınız :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextField(
                   controller: contactMessage,
                  maxLines: 4, //SATIR BIRAKMAYA YARAR
                    decoration: InputDecoration(
                      hintText: "Mesajınızı buraya yazın",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                 ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 144, 221, 120),
                                ),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 10)),
                      ),
                  onPressed: () {
                    Map<String, dynamic> map = {
                      'contactName': contactName.text,
                      'contactMail': contactMail.text,
                      'contactMessage': contactMessage.text,
                    };
                    String rawJson = jsonEncode(map);
                    notifier.add(rawJson);
                    contactName.clear();
                    contactMail.clear();
                    contactMessage.clear();
                  },
                  child: Text(
                  "Gönder",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
               Text(
                  "Kayıtlı İletişim :",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  itemCount: contact.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final decodedContact = jsonDecode(contact[index]);
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Ad Soyad: ${decodedContact['contactName']}',
                                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Mail: ${decodedContact['contactMail']}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              Text(
                                'Mesaj: ${decodedContact['contactMessage']}',
                                textAlign: TextAlign.left,
                                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              notifier.remove(contact[index]);
                            },
                          ),
                        ],
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
