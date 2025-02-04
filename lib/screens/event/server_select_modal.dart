import 'package:dadguide2/components/enums.dart';
import 'package:dadguide2/components/settings_manager.dart';
import 'package:dadguide2/screens/event/event_search_bloc.dart';
import 'package:dadguide2/screens/event/update_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:provider/provider.dart';

Future<void> showServerSelectDialog(BuildContext context) async {
  Fimber.i('Displaying server select dialog');
  var displayState = Provider.of<ScheduleDisplayState>(context);
  return showDialog(
      context: context,
      builder: (innerContext) {
        return SimpleDialog(
          title: const Text('Server'),
          children: [
            CountryTile(displayState, Country.jp),
            CountryTile(displayState, Country.na),
            CountryTile(displayState, Country.kr),
            ListTile(
              onTap: () {
                Navigator.pop(innerContext);
                showUpdateDialog(context);
              },
              leading: Icon(Icons.refresh),
              title: Text('Data Sync'),
            ),
          ],
        );
      });
}

class CountryTile extends StatelessWidget {
  final ScheduleDisplayState displayState;
  final Country country;
  CountryTile(this.displayState, this.country);

  @override
  Widget build(BuildContext context) {
    var selectedCountry = Prefs.eventCountry;
    var icon = selectedCountry == country ? country.iconOnName : country.iconOffName;
    return ListTile(
      onTap: () {
        displayState.server = country;
        Navigator.pop(context);
      },
      leading: Image.asset('assets/images/$icon'),
      title: Text(country.countryName),
    );
  }
}
