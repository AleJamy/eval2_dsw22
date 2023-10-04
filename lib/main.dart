import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil de Usuarios'),
        ),
        body: PerfilUsuarios(),
      ),
    );
  }
}

class PerfilUsuarios extends StatelessWidget {
  final List<String> nombres = ["Alejandra Ortiz", "Cecilia Otero", "Maria Jose Reyes"];
  final List<String> correos = ["alejandra.ortiz22@itca.edu.sv", "usuario2@gmail.com", "usuario3@gmail.com"];
  final List<String> imagenes = ["imagen1.jpg", "imagen2.jpg", "imagen3.jpg"];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: nombres.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(imagenes[index]),
                radius: 50.0,
              ),
              SizedBox(height: 10.0),
              Text(
                nombres[index],
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.0),
              Text(
                correos[index],
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}