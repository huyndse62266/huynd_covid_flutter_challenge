import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huyndcovidflutterchallenge/models/country_model.dart';
import 'package:intl/intl.dart';

class CountryTitle extends StatelessWidget {
  final CountryModel countryModel;

  CountryTitle({this.countryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
                child: Row(
                  children: <Widget>[
                    Flag(
                        countryModel.countryCode,
                        height: 15,
                        width: 25
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                    Text(
                      countryModel.country,
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Text(
                  NumberFormat.decimalPattern().format(countryModel.totalConfirmed),
                  textAlign: TextAlign.right,
                ),
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Text(
                  NumberFormat.decimalPattern().format(countryModel.totalConfirmed),
                  textAlign: TextAlign.right,
                ),
              )
          ),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Text(
                  NumberFormat.decimalPattern().format(countryModel.totalConfirmed),
                  textAlign: TextAlign.right,
                ),
              )
          )
        ],
      ),
    );
  }
}
