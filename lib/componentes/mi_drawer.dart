import 'package:app_ecommerce/componentes/mi_list_tile.dart';
import 'package:flutter/material.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [//drawer header:logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),


              const SizedBox(height: 25,),


            //shop tile
              MiListTile(
                text: "Tienda",
                icon: Icons.home,
                onTab: () => Navigator.pop(context),
              ),

              //cart tle
              MiListTile(
                text: "Carrito",
                icon: Icons.shopping_cart,
                onTab: () {
                  //pop drawer first
                  Navigator.pop(context);

                  //ir a la pagina del carrito
                  Navigator.pushNamed(context, '/cart_page');

                },
              ),
            ],
          ),


          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MiListTile(
              text: "Salir",
              icon: Icons.logout,
              onTab: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route)=>false),
            ),
          ),
          
        ],
      ),
    );
  }
}
