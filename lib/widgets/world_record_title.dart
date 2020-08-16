import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WorldRecordTitle extends StatelessWidget {

  final String title;
  final int totalRecord;
  final Color color;

  WorldRecordTitle({this.title, this.totalRecord, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: color,
      ),

      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
            NumberFormat.decimalPattern().format(totalRecord),
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          textAlign: TextAlign.center,
        )
      ),
    );
  }
}
