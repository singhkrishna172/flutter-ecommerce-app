import 'package:flutter/material.dart';
// import 'package:mark2/models/product.dart';
import 'package:mark2/models/cart_data.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  double get cartTotal {
    double total = 0;

    for (final product in cartItems) {
      final quantity = cartQuantities[product.id] ?? 1;

      total += product.price * quantity;
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Light background color
      // App Bar Section (similar to home page)
      appBar: _buildAppBar(),
      // Scrollable main content
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header Section (Title & Move All Button)
              _buildHeader(),
              const SizedBox(height: 16),

              // 2. Filter & Sort Row
              _buildFilters(),
              const SizedBox(height: 24),

              // 3. Saved Items Grid (2 columns)
              _buildSavedGrid(),
              const SizedBox(height: 16),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cart Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '₹${cartTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // 4. Wide Item Card (Luggage)
              // _buildWideItemCard(),
              // const SizedBox(height: 40),

              // 5. 'You Might Also Love' Section
              _buildCuratedPairingSection(),
              const SizedBox(height: 40), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Methods Below ---
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFAFAFA),
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.architecture,
              size: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'ATELIER',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 16.0, left: 8.0),
        //   child: CircleAvatar(
        //     radius: 16,
        //     backgroundColor: Colors.grey.shade300,
        //     child: const Icon(Icons.person, color: Colors.grey, size: 20),
        //   ),
        // ),
      ],
    );
  }

  // Header Builder
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Saved Items',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  text: '5 curated pieces ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'reserved in your private\nsession',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Move All Button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFE91E63), // Pink color
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 16),
              SizedBox(width: 8),
              Text(
                'MOVE ALL',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Filters Row Builder
  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildChip('All (5)', isSelected: true),
          const SizedBox(width: 8),
          _buildChip('Apparel (2)'),
          const SizedBox(width: 8),
          _buildChip('Living (1)'),
          const SizedBox(width: 8),
          // Sort Dropdown button look-alike
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.swap_vert, size: 16, color: Colors.black),
                SizedBox(width: 4),
                Text(
                  'Recent',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Chip
  Widget _buildChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  // Grid Builder
  Widget _buildSavedGrid() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final product = cartItems[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),

            leading: Image.asset(
              product.image,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),

            title: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),

                Text(product.category),

                const SizedBox(height: 5),

                Text(
                  '₹${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    // Minus button
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (cartQuantities[product.id]! > 1) {
                            cartQuantities[product.id] =
                                cartQuantities[product.id]! - 1;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),

                    // Quantity
                    Text(
                      '${cartQuantities[product.id] ?? 1}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Plus button
                    IconButton(
                      onPressed: () {
                        setState(() {
                          cartQuantities[product.id] =
                              cartQuantities[product.id]! + 1;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),

            trailing: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  cartItems.remove(product);
                  cartQuantities.remove(product.id); // clean up quantity too
                });
              },
            ),
          ),
        );
      },
    );
  }

  // Individual Product Card
  // Widget _buildProductCard(
  //   String title,
  //   String price,
  //   String oldPrice,
  //   String tag,
  //   String rating,
  //   String reviews,
  //   bool isFavorite,
  //   String imagePath, {
  //   bool isHot = false,
  // }) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       // Image Placeholder Box
  //       Expanded(
  //         child: Stack(
  //           children: [
  //             ClipRRect(
  //               borderRadius: BorderRadiusGeometry.circular(12),
  //               child: Image.asset(
  //                 imagePath,
  //                 width: double.infinity,
  //                 height: double.infinity,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //             // Discount / Hot Tag
  //             Positioned(
  //               top: 8,
  //               left: 8,
  //               child: Container(
  //                 padding: const EdgeInsets.symmetric(
  //                   horizontal: 6,
  //                   vertical: 4,
  //                 ),
  //                 decoration: BoxDecoration(
  //                   color: isHot ? Colors.grey.shade200 : Colors.pink,
  //                   borderRadius: BorderRadius.circular(4),
  //                 ),
  //                 child: Text(
  //                   tag,
  //                   style: TextStyle(
  //                     color: isHot ? Colors.black : Colors.white,
  //                     fontSize: 10,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             // Favorite Button
  //             Positioned(
  //               top: 8,
  //               right: 8,
  //               child: Container(
  //                 padding: const EdgeInsets.all(4),
  //                 decoration: const BoxDecoration(
  //                   color: Colors.white,
  //                   shape: BoxShape.circle,
  //                 ),
  //                 child: Icon(
  //                   isFavorite ? Icons.favorite : Icons.favorite_border,
  //                   size: 16,
  //                   color: isFavorite ? Colors.red : Colors.grey,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       // Rating
  //       Row(
  //         children: [
  //           const Icon(Icons.star, size: 12, color: Colors.orange),
  //           const SizedBox(width: 4),
  //           Text(
  //             rating,
  //             style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(width: 4),
  //           Text(
  //             reviews,
  //             style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 4),
  //       // Product Title
  //       Text(
  //         title,
  //         style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
  //         maxLines: 1,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //       const SizedBox(height: 4),
  //       // Price Row
  //       Row(
  //         children: [
  //           Text(
  //             price,
  //             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
  //           ),
  //           const SizedBox(width: 8),
  //           Text(
  //             oldPrice,
  //             style: TextStyle(
  //               color: Colors.grey.shade500,
  //               fontSize: 12,
  //               decoration: TextDecoration.lineThrough,
  //             ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 8),
  //       Container(
  //         width: double.infinity,
  //         padding: const EdgeInsets.symmetric(vertical: 10),
  //         decoration: BoxDecoration(
  //           color: Colors.black,
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: const Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               'ADD TO BAG',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 10,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Wide Item Card (Luggage)
  Widget _buildCuratedPairingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.auto_awesome, size: 14, color: Colors.pink.shade300),
            const SizedBox(width: 4),
            Text(
              'CURATED PAIRING',
              style: TextStyle(
                color: Colors.pink.shade300,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'You Might Also Love',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  'VIEW ALL',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 12,
                  color: Colors.grey.shade800,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Mini grid
        Row(
          children: [
            Expanded(
              child: _buildMiniCard(
                'FRAGRANCE',
                'Hinoki Studio Candle',
                '\$48',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildMiniCard('GLASSWARE', 'Smoked Highball', '\$60'),
            ),
          ],
        ),
      ],
    );
  }

  // Mini Card for Curated Pairing
  Widget _buildMiniCard(String category, String title, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Placeholder
          Stack(
            children: [
              Container(
                height: 120, // fixed height
                decoration: const BoxDecoration(
                  color: Colors.grey, // Placeholder
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
