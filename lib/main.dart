import 'package:flutter/material.dart';
import 'package:new_project/providers/great_places.dart';
import 'package:new_project/screens/place_detail_screen.dart';
import 'package:new_project/screens/place_form_screen.dart';
import 'package:new_project/screens/places_list_screen.dart';
import 'package:new_project/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Greatplaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
          AppRoutes.PLACE_DETAIL: (ctx) => const PlaceDetailSrceen(),
        },
      ),
    );
  }
}
