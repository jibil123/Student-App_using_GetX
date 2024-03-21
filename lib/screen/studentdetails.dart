// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentDetails extends StatelessWidget {
  final stdetails;
  const StudentDetails({super.key, required this.stdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Student Details'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          width: 500,
         child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  // Adjust the radius as needed
                  child: Image.file(
                    File(stdetails.imagex),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name :  ${stdetails.name}',
                        style: GoogleFonts.alice(fontSize: 23,fontWeight: FontWeight.bold)),
                    const SizedBox( height: 10,
                    ),
                    Text('Standard :  ${stdetails.classname}',
                        style:GoogleFonts.alice(fontSize: 23,fontWeight: FontWeight.bold)),
                    const SizedBox( height: 10,
                    ),
                    Text('Guardian :  ${stdetails.father}',
                        style:  GoogleFonts.alice(fontSize: 23,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10,
                    ),
                    Text ('Contact :  ${stdetails.pnumber}',
                        style: GoogleFonts.alice (fontSize: 23,fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
