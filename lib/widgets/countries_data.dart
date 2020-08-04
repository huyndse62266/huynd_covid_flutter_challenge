import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/models/country_model.dart';

class CountriesData extends StatelessWidget {
  final List<CountryModel> countriesData;

  CountriesData(this.countriesData);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 0,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            "Country",
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
            label: Text(
              "Total cases",
              style: TextStyle(

              ),
            )
        ),
        DataColumn(
            label: Text(
              "Recovered",
              style: TextStyle(

              ),
            )
        ),
        DataColumn(
            label: Text(
              "Deaths",
              style: TextStyle(

              ),
            )
        ),

      ],
      rows:  countriesData.map(((data) => DataRow(
          cells: <DataCell>[
            DataCell(
                Row(
                  children: <Widget>[
                    Flag(data.countryCode, height: 20, width: 50),
                    Text(data.country),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                )
            ),
            DataCell(
                Text(
                  data.totalConfirmed.toString(),
                  textAlign: TextAlign.right,
                )
            ),
            DataCell(
                Text(
                  data.totalRecovered.toString(),
                  textAlign: TextAlign.right,
                )
            ),
            DataCell(
                Text(
                  data.totalDeaths.toString(),
                  textAlign: TextAlign.right,
                )
            ),
          ]
      ))).toList()
    );
  }
}
