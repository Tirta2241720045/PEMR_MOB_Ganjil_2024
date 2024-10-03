import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja_application/models/item.dart';

class ItemPage extends StatelessWidget {
  final Item item; // Add this line to accept the item as a named parameter

  // Modify the constructor to accept 'item' as a named parameter
  ItemPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[500],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Use context.goBack() instead of Navigator.pop()
            context.go('/');
          },
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: item.name,
            child: Image.asset(
              item.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Price: \$${item.price}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Stock: ${item.stock} left',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Rating: ${item.rating} ⭐',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
