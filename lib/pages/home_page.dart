import 'package:app_ecommerce/componentes/mi_drawer.dart';
import 'package:app_ecommerce/componentes/mi_producto_tile.dart';
import 'package:app_ecommerce/modelos/tienda.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {

    //acceso a los productos en la tienda
    final productos = context.watch<Tienda>().tienda;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tienda'),

      ),
      drawer: const MiDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25),

          //shop subtitulo
          Center(
              child: Text(
                "Selecciona los productos",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              )
          ),


          //lista de productos
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: productos.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                //get each individual product from shop
                final producto = productos[index];

                //return as a product tile UI
                return MiProductoTile(producto: producto);

              },
            ),
          ),
        ],
      ),
      //body: Center(child: Text("LOGEADO COMO: " + user.email! )),
    );
  }
}