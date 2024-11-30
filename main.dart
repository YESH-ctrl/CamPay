import 'package:flutter/material.dart';
import 'screens/crispy_chicken_screen.dart';
import 'screens/meals_screen.dart';
import 'screens/juice_point_screen.dart';
import 'screens/tiffins_screen.dart';
import 'screens/nescafe_screen.dart';
import 'screens/ice_cream_screen.dart';
import 'screens/stationary_screen.dart';
import 'screens/FC_screen.dart';

void main() {
  runApp(const CamPayApp());
}

class CamPayApp extends StatelessWidget {
  const CamPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        '/categories': (context) => const CategoriesPage(),
        '/fc': (context) => const FCPage(),
        '/crispyChicken': (context) => const CrispyChickenScreen(),
        '/meals': (context) => const MealsPage(),
        '/juice-point': (context) => const JuicePointPage(),
        '/tiffins': (context) => const TiffinsPage(),
        '/nescafe': (context) => const NesCafePage(),
        '/icecream': (context) => const IceCreamPage(),
        '/stationary': (context) => const StationaryPage(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: const Color(0xFF00796B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to CamPay',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00796B),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                if (emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  Navigator.pushNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields!')),
                  );
                }
              },
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        title: const Text(
          'CamPay',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: HomeContentPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF00796B),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello There!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                'Special Offers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward, color: Color(0xFF00796B)),
                onPressed: () {
                  Navigator.pushNamed(context, '/categories');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
        title: const Text(
          'CamPay',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/fc');
              },
              child: _buildCategoryItem('FC', Icons.store),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/crispyChicken'); // New route
              },
              child: _buildCategoryItem('Crispy Chicken', Icons.fastfood),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/meals'); // Route for Meals
              },
              child: _buildCategoryItem('Meals', Icons.restaurant),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/juice-point'); // Route for Juice Point
              },
              child: _buildCategoryItem('Juice Point', Icons.local_drink),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/tiffins'); // Route for Tiffins Page
              },
              child: _buildCategoryItem('Tiffins', Icons.rice_bowl),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/nescafe'); // Route for NesCafe Page
              },
              child: _buildCategoryItem('NesCafe', Icons.coffee),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/icecream'); // Route for Ice Cream Page
              },
              child: _buildCategoryItem('Ice Cream', Icons.icecream),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/stationary'); // Route for Stationary Page
              },
              child: _buildCategoryItem('Stationary', Icons.shopping_bag),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String label, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.teal[100],
          child: Icon(icon, size: 36, color: Colors.teal),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
