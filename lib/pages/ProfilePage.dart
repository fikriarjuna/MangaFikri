import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Detail',
          style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  width: screenWidth * 0.4,
                  height: screenHeight * 0.2,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 2,
                ))),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person_outline_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "MUHAMAD FIKRI ARJUNA",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 2,
                ))),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.cake_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "02 JUNE 2002",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 2,
                ))),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.mail_outline,
                      size: 40,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "fikriarjuna20@gmail.com",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                    )
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.white,
                  width: 2,
                ))),
                padding: const EdgeInsets.all(15),
                child: const Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 30),
                    Text(
                      "+62 898-6648-730",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
