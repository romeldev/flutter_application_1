import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  static const _categories = [
    _Category(emoji: '🍔', name: 'Restaurantes'),
    _Category(emoji: '💊', name: 'Farmacias'),
    _Category(emoji: '🍺', name: 'Licoreria'),
    _Category(emoji: '🎁', name: 'Regalos'),
    _Category(emoji: '🐾', name: 'Mascotas'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Delivery 🚀'),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoriesSection(),
          ],
        )
      ),
    );
  }


  Widget _buildCategoriesSection() {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categorias',
                  // style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  //   fontWeight: FontWeight.bold
                  // )
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Ver todo')
                ),
              ]
            )
          ),

          // carrusel horizontal
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return _buildCategoryCard(_categories[index]);
              },
            )
          ),
        ],
      )
    );
  }


  Widget _buildCategoryCard(_Category category) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: 120,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(category.emoji, style: const TextStyle(fontSize: 28)),
                const SizedBox(height: 6),
                Text(
                  category.name,
                  style: const TextStyle(fontSize: 11),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          )
        )
      )
    );
  }
}



class _Category {
  final String emoji;
  final String name;

  const _Category({required this.emoji, required this.name});
}