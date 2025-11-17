import 'package:flutter/cupertino.dart';
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
<<<<<<< HEAD
      appBar: AppBar(
        title: const Text("Add Product"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: storesList.isEmpty
            ? _noStoreWidget(context)
            : _addProductForm(context),
      ),
    );
  }

  // *************** لا يوجد محلات ***************
  Widget _noStoreWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.store_mall_directory, size: 80, color: Colors.grey),
          const SizedBox(height: 20),
          const Text(
            "لا يوجد أي محل مضاف",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // روح على صفحة إنشاء محل
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateStoreScreen()),
              ).then((value) {
                // بعد ما يرجع من صفحة إنشاء محل
                _loadStores();
              });
            },
            child: const Text("إنشاء محل"),
          ),
        ],
      ),
    );
  }

  // *************** يوجد محلات : عرض فورم المنتج ***************
  Widget _addProductForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("اختر المحل", style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),

        // Dropdown اختيار المحل
        DropdownButtonFormField<String>(
          initialValue: selectedStore,
          items: storesList
              .map((s) => DropdownMenuItem(value: s, child: Text(s)))
              .toList(),
          onChanged: (value) {
            setState(() => selectedStore = value);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "اختر المحل",
          ),
        ),

        const SizedBox(height: 30),

        if (selectedStore != null) ...[
          const Text(
            "أدخل بيانات المنتج",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "اسم المنتج",
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "السعر",
            ),
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // عملية إضافة المنتج
            },
            child: const Text("إضافة المنتج"),
          ),
        ],
      ],
    );
  }
}

// ************ صفحة إنشاء محل (مثال بسيط) ************
class CreateStoreScreen extends StatelessWidget {
  const CreateStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إنشاء محل")),
      body: Padding(
        padding: const EdgeInsets.all(16),
=======
      appBar: AppBar(title: const Text("Add Product")),
      body: SingleChildScrollView(
>>>>>>> cf3ac542d2963fd17b2a987673af5d35329baa15
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
