import 'package:flutter/material.dart';
import '../database/app_database.dart';

class ProductPage extends StatefulWidget {
  final AppDatabase db;
  const ProductPage({super.key, required this.db});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late AppDatabase db;
  List<Product> products = [];

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    db = widget.db;
    refreshProducts();
  }

  Future<void> refreshProducts() async {
    final data = await db.getAllProducts();
    setState(() => products = data);
  }

  Future<void> addProduct() async {
    if (nameController.text.isEmpty || priceController.text.isEmpty) return;
    final product = ProductsCompanion.insert(
      name: nameController.text,
      price: double.tryParse(priceController.text) ?? 0.0,
    );
    await db.insertProduct(product);
    nameController.clear();
    priceController.clear();
    refreshProducts();
  }

  Future<void> deleteProduct(int id) async {
    await db.deleteProduct(id);
    refreshProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Manager (Drift ORM)')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  onPressed: addProduct,
                  icon: const Icon(Icons.add, color: Colors.blue),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return ListTile(
                  title: Text(p.name),
                  subtitle: Text('Price: \$${p.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteProduct(p.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
