import 'package:flutter/material.dart';

class Testsssss extends StatelessWidget {
  const Testsssss({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Category Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation =
        Tween<double>(begin: 0, end: 200).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Animation'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              if (_isOpen) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              setState(() {
                _isOpen = !_isOpen;
              });
            },
            child: Text(_isOpen ? 'Close Categories' : 'Open Categories'),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return SizedBox(
                height: 35,
                width: _animation.value,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Category 1")),
                    ElevatedButton(onPressed: () {}, child: Text("Category 1")),
                    ElevatedButton(onPressed: () {}, child: Text("Category 1")),
                    ElevatedButton(onPressed: () {}, child: Text("Category 1")),
                    ElevatedButton(onPressed: () {}, child: Text("Category 1")),
                    ElevatedButton(onPressed: () {}, child: Text("Category 1")),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class CategoryItem extends StatelessWidget {
  final String title;

  const CategoryItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
