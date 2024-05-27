import 'package:app_ecommerce/componentes/mi_boton.dart';
import 'package:app_ecommerce/modelos/producto.dart';
import 'package:app_ecommerce/modelos/tienda.dart';
import 'package:app_ecommerce/pages/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //eliminar el producto del carrito
  void removeItemFromCart(BuildContext context, Producto producto) {
    //enseñar un mensaje de confirmacion para eliminar el producto del carrito
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Eliminar este producto de tu carrito"),
        actions: [
          //boton de cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          //boton si
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Tienda>().removeFromCart(producto);
            },
            child: const Text("Sí"),
          ),
        ],
      ),
    );
  }

  //usurio presiona el boton "pagar"
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("El usuario quiere pagar!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Tienda>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Carrito"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //lista
          Expanded(
            child: cart.isEmpty
                ? const Center(child: Text("Tu carrito esta vacio.."))
                : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  leading: Image.asset(
                    item.imagenPath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.nombre),
                  subtitle: Text('\$${item.precio.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),

          //boton pagar
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MiBoton(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                builder: (context) => const PaymentPage(),
              ),
              ),
              child: const Text("PAGAR AHORA"),
            ),
          ),
        ],
      ),
    );
  }
}