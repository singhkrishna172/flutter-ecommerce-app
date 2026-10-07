import 'package:flutter/material.dart';
import 'package:mark2/models/product.dart';
import 'package:mark2/models/cart_data.dart';

// This page shows all the details of a single product.
// It receives a Product object from the previous screen.
class ProductDetailPage extends StatefulWidget {
  // The product whose details we want to show
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ─── APP BAR ─────────────────────────────────────────────────────
      // Shows a back arrow and the product name at the top
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),

      // SingleChildScrollView lets the page scroll if content is long
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── SECTION 1: Product Image ───────────────────────────────
            // Shows the product image in a rounded box
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget
                      .product
                      .image, // image path comes from the Product model
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20), // empty space between sections
            // ─── SECTION 2: Product Name ────────────────────────────────
            Text(
              widget.product.name, // name comes from the Product model
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),

            // ─── SECTION 3: Category Label ──────────────────────────────
            // Shows which category this product belongs to
            Text(
              widget.product.category, // category comes from the Product model
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),

            // ─── SECTION 4: Price ───────────────────────────────────────
            Text(
              '₹${widget.product.price.toStringAsFixed(2)}', // price from Product model
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 24),

            // ─── SECTION 5: Description ─────────────────────────────────
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This is a premium product with excellent quality and performance. '
              'It is designed to meet all your needs and exceed your expectations.',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 32),

            // ─── SECTION 6: Add to Cart Button ──────────────────────────
            // Full-width button at the bottom to add the product to the cart
            SizedBox(
              width: double.infinity, // make the button span the full width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // dark button background
                  foregroundColor: Colors.white, // white text/icon color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final id = widget.product.id;
                  if (cartQuantities.containsKey(id)) {
                    // Item already in cart — just bump the quantity
                    cartQuantities[id] = cartQuantities[id]! + 1;
                  } else {
                    // First time adding — register item and set quantity to 1
                    cartItems.add(widget.product);
                    cartQuantities[id] = 1;
                  }
                  // Show a small confirmation message when tapped
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${widget.product.name} added to cart!'),
                    ),
                  );
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
