import 'package:flutter/material.dart';

void main() => runApp(AppCafeteria());

class AppCafeteria extends StatelessWidget {
  const AppCafeteria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cafeteria",
      home: Postres(),
    );
  }
}//Fin clase app cafeteria
class Postres extends StatelessWidget {
  const Postres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: const Text(
          'Cafetería 23 casi 24 Nava - 6º J',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 238, 205, 195), // Café oscuro
        leading: IconButton(
          icon: const Icon(Icons.coffee, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
  padding: const EdgeInsets.all(16),
  itemCount: 4,
  itemBuilder: (context, index) {
    // Lista actualizada con postres y colores cálidos
    final List<Map<String, dynamic>> items = [
      {
        't': 'Tarta de Red Velvet', 
        's': 'Bizcocho suave con crema de queso', 
        'i': Icons.cake_outlined, 
        'c': const Color.fromARGB(255, 247, 248, 211)
      },
      {
        't': 'Muffin de Arándanos', 
        's': 'Recién horneado y esponjoso', 
        'i': Icons.bakery_dining_outlined, 
        'c': const Color.fromARGB(255, 218, 205, 255)
      },
      {
        't': 'Cheesecake de Maracuyá', 
        's': 'Base de galleta y toque tropical', 
        'i': Icons.icecream_outlined, 
        'c': const Color.fromARGB(255, 255, 236, 202)
      },
      {
        't': 'Brownie con Nueces', 
        's': 'Chocolate intenso 70% cacao', 
        'i': Icons.cookie_outlined, 
        'c': const Color.fromARGB(255, 224, 190, 177)
      },
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: items[index]['c'].withOpacity(0.1), // Sombra del color del postre
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // 1. Leading: Icono representativo del postre
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: items[index]['c'].withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(items[index]['i'], color: items[index]['c']),
        ),
        // 2. Title: Nombre del postre
        title: Text(
          items[index]['t'],
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16,
            color: Color(0xFF2D2D2D) // Un gris muy oscuro casi negro
          ),
        ),
        // 3. Subtitle: Descripción corta
        subtitle: Text(items[index]['s']),
        // 4. Trailing: Botón de "Agregar"
        trailing: CircleAvatar(
          radius: 18,
          backgroundColor: items[index]['c'],
          child: IconButton(
            icon: const Icon(Icons.add, size: 18, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: items[index]['c'],
                  content: Text('¡${items[index]['t']} añadido al carrito!'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ),
      ),
    );
  },
),
);
  }
}//Fin clase postres