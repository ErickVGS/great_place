import 'package:flutter/material.dart';
import 'package:new_project/providers/great_places.dart';
import 'package:new_project/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus Lugares'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<Greatplaces>(context, listen: false).loadPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Consumer<Greatplaces>(
                  child: const Center(
                    child: Text('Nenhum local cadastrado'),
                  ),
                  builder: (ctx, greatPlaces, ch) => greatPlaces.itemCount == 0
                      ? ch!
                      : ListView.builder(
                          itemCount: greatPlaces.itemCount,
                          itemBuilder: (ctx, i) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: FileImage(
                                      greatPlaces.itemByIndex(i).image),
                                ),
                                title: Text(greatPlaces.itemByIndex(i).title),
                                subtitle: Text(greatPlaces
                                    .itemByIndex(i)
                                    .location!
                                    .address!),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.PLACE_DETAIL,
                                      arguments: greatPlaces.itemByIndex(i));
                                },
                              )),
                ),
        ));
  }
}
