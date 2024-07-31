import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Let’s start Cooking',
          style: TextStyle(
            color: Color.fromARGB(255, 91, 86, 86),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipe',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                      width: 1.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 91, 86, 86),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        color: Color.fromARGB(255, 91, 86, 86),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryButton('Trending', isSelected: false),
                  _buildCategoryButton('New', isSelected: true),
                  _buildCategoryButton('Popular', isSelected: false),
                ],
              ),
              const SizedBox(height: 20),
              _buildRecipeCard(
                'assets/chicken.jfif',
                'Fried chicken',
                'By Siren',
                '220',
              ),
              const SizedBox(height: 20),
              _buildRecipeCard(
                'assets/soup2.jpg',
                'Another Recipe',
                'By Chef',
                '150',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String label, {required bool isSelected}) {
    final selectedColor = const Color.fromARGB(255, 198, 142, 57);
    final borderColor = const Color.fromARGB(255, 208, 147, 33);

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? selectedColor : Colors.white,
        side: BorderSide(
          color: isSelected ? selectedColor : borderColor.withOpacity(0.5),
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : borderColor,
        ),
      ),
    );
  }

  Widget _buildRecipeCard(
      String imagePath, String title, String author, String likes) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 91, 86, 86),
                      ),
                    ),
                    Text(
                      author,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      likes,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.favorite, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
