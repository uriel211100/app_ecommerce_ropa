import 'package:app_ecommerce/modelos/producto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modelos/tienda.dart';

class MiProductoTile extends StatelessWidget {
  final Producto producto;

  const MiProductoTile({
    super.key,
    required this.producto,
  });

  //boton de añadir
  void addToCart(BuildContext context) {
    //enseñar un mensaje de confirmacion para añadir al carrito
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("¿Añadir este producto a tu carrito?"),
        actions: [
          //boton de cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),

          //boton si
          MaterialButton(
            onPressed: () {
              // Añadir el producto al carrito
              context.read<Tienda>().addToCart(producto);

              // Cerrar el diálogo
              Navigator.pop(context);

              // Mostrar un mensaje de "Agregado exitosamente al carrito"
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Agregado exitosamente al carrito"),
                ),
              );
            },
            child: Text("Sí"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // producto imagen
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(producto.imagenPath),
                ),
              ),

              const SizedBox(height: 25),

              //producto nombre
              Text(
                producto.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              //Producto descripcion
              Text(
                producto.descripcion,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          //producto precio + añadir al carrito boton
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Precio del producto
              Text('\$' + producto.precio.toStringAsFixed(2)),

              //Carrito boton
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
