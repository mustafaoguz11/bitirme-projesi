import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/activityItem/activityItem.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityDetailsPage extends StatelessWidget {
  final String? title;
  final String? description;
  final String? date;
  final String? location;
  final String? contact;
  final String? payment;
  final String? imageAsset;

  const ActivityDetailsPage({
    Key? key,
    this.title,
    this.description,
    this.date,
    this.location,
    this.contact,
    this.payment,
    this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 60, 255, 0), title: Text(
          title!,
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActivityItem(
                    title: title!,
                    description: description!,
                    date: date!,
                    location: location!,
                    contact: contact!,
                    payment: payment!,
                    imageAsset: imageAsset!),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 144, 221, 120),
                    ),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 10)),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Satın Al",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
