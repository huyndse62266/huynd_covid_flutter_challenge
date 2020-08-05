import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class WorldRecordTitle extends StatelessWidget {

  final String title;
  final int totalRecord;
  final int newRecord;

  WorldRecordTitle(this.title, this.totalRecord, this.newRecord);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),

      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 16,
          )
        ),
        subtitle: RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: NumberFormat.decimalPattern().format(totalRecord),
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                ),
                TextSpan(
                    text: newRecord != null ? '(+${NumberFormat.decimalPattern().format(newRecord)})' : '',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
