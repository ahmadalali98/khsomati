import 'package:flutter/material.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final List stores = ["zara", "nike", "adidas"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Select store or create one"),
            Expanded(
              child: SizedBox(
                height: 30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 30,
                      height: 30,
                      child: Center(child: Text(stores[index])),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 20);
                  },
                  itemCount: stores.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
