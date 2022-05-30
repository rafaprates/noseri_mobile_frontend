import 'package:flutter/material.dart';
import 'package:noseri_app/custom_widgets/header.dart';
import 'package:noseri_app/models/Load.dart';
import 'package:noseri_app/services/networking.dart';

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Header(
      body: FutureLoadListBuilder(),
    );
  }
}

// Resgata a lista de Loads do servidor.
class FutureLoadListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Load>>(
      future: NetworkHelper().fetchLoadList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return LoadListView(Loads: snapshot.requireData);
          }
          return Text("snapshot.data: ${snapshot.data}");
        } else if (snapshot.hasError) {
          return Text("Erro: dados nao encontrados.");
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// LoadList View --------------->
class LoadListView extends StatefulWidget {
  List<Load> Loads = [];
  LoadListView({required this.Loads});

  // Gets a Load object as input and returns the appropriate icon.
  IconData iconToShow(Load load) {
    if (load.isTracked) {
      return Icons.check;
    } else {
      return Icons.check_box_outline_blank;
    }
  }

  // Gets a Load object as input and returns a ListTile.
  ListTile lt(Load load) {
    return ListTile(
      title: Text(load.loadName),
      trailing: Icon(
        iconToShow(load),
      ),
      onTap: () {
        // Inverts the isTracked attribute everytime it's pressed
        load.isTracked = !load.isTracked;
        iconToShow(load);
      },
    );
  }

  @override
  _LoadListViewState createState() => _LoadListViewState();
}

class _LoadListViewState extends State<LoadListView> {
  @override
  Widget build(BuildContext context) {
    List<String> loadNames = [];
    //List<LoadListTile> LoadsTiles = [];
    List<ListTile> LoadsTiles = [];

    for (var Load in widget.Loads) {
      ListTile lt = ListTile(
        title: Text(Load.loadName),
        trailing: Icon(
          widget.iconToShow(Load),
        ),
        onTap: () {
          Load.isTracked = !Load.isTracked;
          String isTracked = Load.isTracked.toString();
          NetworkHelper().addTrackedLoad(Load.loadName, isTracked);
          widget.iconToShow(Load);
          setState(() {});
        },
      );
      LoadsTiles.add(
        (lt),
      );
    }

    return ListView(
      children: LoadsTiles,
    );
  }
}
// LoadList View <---------------
