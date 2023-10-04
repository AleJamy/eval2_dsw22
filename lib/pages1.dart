import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Producto {
  String nombre;
  double precio;
  int stock;

  Producto(this.nombre, this.precio, this.stock);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Registro de Productos'),
        ),
        body: RegistroProducto(),
      ),
    );
  }
}

class RegistroProducto extends StatefulWidget {
  @override
  _RegistroProductoState createState() => _RegistroProductoState();
}

class _RegistroProductoState extends State<RegistroProducto> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  List<Producto> productos = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: nombreController,
            decoration: InputDecoration(labelText: 'Nombre del Producto'),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: precioController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Precio'),
          ),
          SizedBox(height: 10.0),
          TextField(
            controller: stockController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Stock'),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  String nombre = nombreController.text;
                  double precio = double.tryParse(precioController.text) ?? 0.0;
                  int stock = int.tryParse(stockController.text) ?? 0;

                  Producto nuevoProducto = Producto(nombre, precio, stock);
                  productos.add(nuevoProducto);

                  nombreController.clear();
                  precioController.clear();
                  stockController.clear();
                },
                child: Text('Guardar'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Mostrar la lista de productos registrados
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Productos Registrados'),
                        content: Container(
                          width: double.minPositive,
                          child: ListView.builder(
                            itemCount: productos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text('Nombre: ${productos[index].nombre}'),
                                subtitle: Text('Precio: \$${productos[index].precio.toStringAsFixed(2)}, Stock: ${productos[index].stock}'),
                              );
                            },
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Consultar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}