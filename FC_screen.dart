import 'package:flutter/material.dart';

class FCPage extends StatefulWidget {
  const FCPage({super.key});

  @override
  _FCPageState createState() => _FCPageState();
}

class _FCPageState extends State<FCPage> {
  final Map<String, int> items = {
    'Chicken Fried Rice': 0,
    'Egg Fried Rice': 0,
    'Veg Fried Rice': 0,
    'Paneer Biryani': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        title: const Text('F C'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Timings: 9:00 AM - 10:00 PM',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Available Items:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: items.keys.map((item) {
                  return Card(
                    child: ListTile(
                      title: Text(item),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (items[item]! > 0)
                                  items[item] = items[item]! - 1;
                              });
                            },
                          ),
                          Text('${items[item]}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                items[item] = items[item]! + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00796B),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(cartItems: items),
              ),
            );
          },
          child: const Text(
            'View Cart',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final Map<String, int> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final filteredCartItems =
        cartItems.entries.where((entry) => entry.value > 0).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        title: const Text('Your Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: filteredCartItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredCartItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredCartItems[index];
                        return Card(
                          child: ListTile(
                            title: Text(item.key),
                            trailing: Text('Quantity: ${item.value}'),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00796B),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Proceeding to Checkout...')),
                      );
                    },
                    child: const Text(
                      'Checkout',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }
}
