
import 'package:app_ecommerce/modelos/producto.dart';
import 'package:flutter/cupertino.dart';

class Tienda extends ChangeNotifier{

  //productos
  final List<Producto> _tienda = [
    //producto 1
    Producto(
      nombre: "Vestido de Verano",
      precio: 29.99,
      descripcion: "Vestido corto de verano con estampado floral y tirantes ajustables. Ideal para días soleados.",
      imagenPath: 'assets/vestidoVerano.jpg',
    ),
    //producto 1
    Producto(
      nombre: "Camiseta Básica",
      precio: 15.99,
      descripcion: "Camiseta básica de algodón 100% con cuello redondo y manga corta.",
      imagenPath: 'assets/camisetaBlanca.jpg',
    ),
    //producto 1
    Producto(
      nombre: "Jeans Skinny para hombre",
      precio: 39.99,
      descripcion: "Jeans ajustados de mezclilla con un toque de elastano para mayor comodidad. Disponible en color azul",
      imagenPath: 'assets/jeansSkinny.jpg',
    ),
    //producto 1
    Producto(
      nombre: "Suéter de Punto",
      precio: 29.99,
      descripcion: "Suéter de punto con cuello redondo y diseño trenzado. Ideal para los días más fríos.",
      imagenPath: 'assets/sueterPunto.jpg',
    ),

    Producto(
      nombre: "Blusa de Seda",
      precio: 45.99,
      descripcion: "Blusa de seda con mangas largas y cuello en V.",
      imagenPath: 'assets/blusaSeda2.jpg',
    ),

    Producto(
      nombre: "Falda Midi Plisada",
      precio: 34.99,
      descripcion: "Falda midi plisada en color negro, elegante y versátil. Ideal para combinar con blusas o camisetas",
      imagenPath: 'assets/faldaMidi.jpg',
    ),

    Producto(
      nombre: "Short Deportivo para Mujer",
      precio: 24.99,
      descripcion: "Diseñado para ofrecer máxima comodidad y rendimiento durante tus actividades físicas.",
      imagenPath: 'assets/shortDeportivo.jpg',
    ),

    Producto(
      nombre: "Chaqueta de Cuero",
      precio: 119.99,
      descripcion: "Chaqueta de cuero auténtico con un diseño clásico y atemporal.",
      imagenPath: 'assets/chaquetaCuero.jpg',
    ),

    Producto(
      nombre: "Calcetines Deportivos",
      precio: 12.99,
      descripcion: "Fabricados con una mezcla de algodón, poliéster y elastano.(Paquete de 3 pares)",
      imagenPath: 'assets/calcetinesDeportivos2.jpg',
    ),


  ];


  //user cart
  List<Producto> _cart = [];

  //get product list
  List<Producto> get tienda => _tienda;


  //get user cart
  List<Producto> get cart => _cart;


  //add item to cart
  void addToCart(Producto item){
    _cart.add(item);
    notifyListeners();
  }


  //remove item from cart
  void removeFromCart(Producto item){
    _cart.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }





}