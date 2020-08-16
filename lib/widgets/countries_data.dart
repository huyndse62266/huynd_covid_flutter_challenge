import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/country_model.dart';
import '../widgets/country_title.dart';
import '../utils/constants.dart' as Constants;
class CountriesData extends StatelessWidget {
  final List<CountryModel> countriesData;

  CountriesData(this.countriesData);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Text(
                      'Coutries',
                      style: GoogleFonts.roboto(
                        color: Color(Constants.ACTIVE_COLOR),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Total cases',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Recovered',
                      style: GoogleFonts.roboto(
                        color: Color(Constants.RECOVERED_COLOR),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Text(
                      'Deaths',
                      style: GoogleFonts.roboto(
                        color: Color(Constants.DEATH_COLOR),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => CountryTitle(countryModel: countriesData[index])
          )
        ],
      ),
    );
  }
}
