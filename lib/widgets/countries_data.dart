import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:huyndcovidflutterchallenge/models/country_model.dart';
import 'package:intl/intl.dart';

class CountriesData extends StatelessWidget {
  final List<CountryModel> countriesData;

  CountriesData(this.countriesData);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return DataTable(
      columnSpacing: 0,
      columns: <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              "Countries",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        DataColumn(
            label: Expanded(
              child: Text(
                "Total cases",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.right,
              ),
            )
        ),
        DataColumn(
            label: Expanded(
              child: Text(
                "Recovered",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.right,
              ),
            )
        ),
        DataColumn(
            label: Expanded(
              child: Text(
                "Deaths",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.right,
              ),
            )
        ),

      ],
      rows:  countriesData.map(((data) => DataRow(
          cells: <DataCell>[
            DataCell(
                Row(
                  children: <Widget>[
                    Flag(
                        data.countryCode,
                        height: 15,
                        width: 25
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                    Text(
                      data.country,
                      style: TextStyle(
                        fontSize: 12
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                )
            ),
            DataCell(
                Container(
                  width: double.infinity,
                  child: Text(
                    NumberFormat.decimalPattern().format(data.totalConfirmed),
                    textAlign: TextAlign.right,
                  ),
                )
            ),
            DataCell(
                Container(
                  width: double.infinity,
                  child: Text(
                    NumberFormat.decimalPattern().format(data.totalRecovered),
                    textAlign: TextAlign.right,
                  ),
                )
            ),
            DataCell(
                Container(
                  width: double.infinity,
                  child: Text(
                    NumberFormat.decimalPattern().format(data.totalDeaths),
                    textAlign: TextAlign.right,
                  ),
                )
            ),
          ]
      ))).toList()
//        rows:  <DataRow>[
//          DataRow(
//            cells: <DataCell>[
//              DataCell(Text('Sarah')),
//              DataCell(
//                  Container(
//                    width: double.infinity,
//                    child: Text(
//                      '19',
//                      textAlign: TextAlign.right,
//                    ),
//                  )
//              ),
//              DataCell(
//                  Container(
//                    width: double.infinity,
//                    child: Text(
//                      '19',
//                      textAlign: TextAlign.right,
//                    ),
//                  )
//              ),
//              DataCell(
//                  Container(
//                    width: double.infinity,
//                    child: Text(
//                      '19',
//                      textAlign: TextAlign.right,
//                    ),
//                  )
//              ),
//            ],
//          ),
//        ]
    );
  }
}
