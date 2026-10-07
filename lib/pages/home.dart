import 'package:flutter/material.dart';
import 'package:mark2/models/product.dart';

import 'product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All'; //default cato

  final List<Product> products = [
    Product(
      id: '1',
      name: 'laptop',
      price: 2999,
      image: 'assets/images/laptop.jpg',
      category: 'Electronics',
    ),

    Product(
      id: '2',
      name: 'FarmHouse',
      price: 4999,
      image: 'assets/images/farm.jpg',
      category: 'realstate',
    ),

    Product(
      id: '3',
      name: 'Tata Aria',
      price: 3499,
      image: 'assets/images/Tata_Aria.jpg',
      category: 'automobile',
    ),

    Product(
      id: '4',
      name: 'Iphone',
      price: 3499,
      image: 'assets/images/iphone.jpg',
      category: 'Electronics',
    ),
  ];

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return products;
    }

    return products
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFFAFAFA,
      ), // Light background color from design
      // App Bar Section
      appBar: _buildAppBar(),
      // Main Content wrapped in SingleChildScrollView for scrolling
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // 1. Search Bar Section
              // _buildSearchBar(),
              // const SizedBox(height: 16),

              // 2. Categories List Section
              _buildCategories(),
              const SizedBox(height: 24),

              // 3. Banner Section
              // _buildBanner(),
              // const SizedBox(height: 32),

              // 4. Trending Now Section Header
              Row(
                children: [
                  const Icon(Icons.circle, size: 8, color: Colors.pink),
                  const SizedBox(width: 4),
                  const Text(
                    'LIMITED SPOTLIGHT',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              _buildSectionHeaderRow('Trending Now', showViewAll: true),
              const SizedBox(height: 16),

              // Product Grid Section
              _buildProductGrid(),
              const SizedBox(height: 32),

              // 5. Curated Stories Section Header
              const Text(
                'THE JOURNAL',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              _buildSectionHeaderRow('Curated Stories', showArrows: true),
              const SizedBox(height: 16),

              // Stories List Section
              _buildStoriesList(),
              const SizedBox(height: 32),

              // 6. Newsletter/Join Circle Section
              _buildNewsletterSection(),
              const SizedBox(height: 32), // Bottom padding
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
          // Placeholder for Logo
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
        // Notification Icon with red dot
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
        // Profile Avatar Placeholder
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

  // Helper method to build Search Bar
  Widget _buildCategories() {
    final categories = ['All', 'Electronics', 'realstate', 'automobile'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            //track the user intraction
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category;
                });
              },
              // designe
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontSize: 13,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Helper method to build Banner Card
  Widget _buildSectionHeaderRow(
    String title, {
    bool showViewAll = false,
    bool showArrows = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        if (showViewAll)
          Row(
            children: [
              Text(
                'View all',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Icon(Icons.chevron_right, size: 16, color: Colors.grey.shade600),
            ],
          ),
        if (showArrows)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, size: 16),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward, size: 16),
              ),
            ],
          ),
      ],
    );
  }

  // Product Grid
  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.7,
      ),

      itemCount: filteredProducts.length,

      itemBuilder: (context, index) {
        final product = filteredProducts[index];

        return _buildProductCard(product);
      },
    );
  }

  // Individual Product Card
  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },

      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 4),

                  Text('₹${product.price}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Curated Stories List
  Widget _buildStoriesList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildStoryCard(
            'assets/images/pottery.jpg',
            'Craft & Origin',
            'The Soul of Tactile Pottery',
            'Inside the Kyoto workshop shaping our\nnew slow living stoneware vessel capsule.',
          ),
          const SizedBox(width: 16),
          _buildStoryCard(
            'assets/images/wollen.jpg',
            'Material Focus',
            'Wollen Cloths',
            'Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry.',
          ),
        ],
      ),
    );
  }

  // Individual Story Card
  Widget _buildStoryCard(
    String imagePath,
    String tag,
    String title,
    String desc,
  ) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Story Image Placeholder
          Stack(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    tag,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
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
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Text(
                      'Read article',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, size: 12, color: Colors.pink),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Newsletter / The Atelier Circle Section
  Widget _buildNewsletterSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 199, 199),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Badge Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.workspace_premium, color: Colors.pink),
          ),
          const SizedBox(height: 16),
          const Text(
            'The Atelier Circle',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Unlock private trunk shows, archive releases,\nand complimentary bespoke tailoring.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          // Email Input Row
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter your email',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Join',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
