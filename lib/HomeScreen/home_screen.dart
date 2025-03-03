import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> liquorItems = [
    "https://i0.wp.com/graphicforfree.com/wp-content/uploads/2022/12/liquor-bottle-mockup_4th-perspective-mockup_prev01.png?fit=1200%2C1200&ssl=1",
    "https://media.gettyimages.com/id/1658420093/photo/hand-of-a-man-refusing-red-wine-and-showing-car-keys-and-a-glass-of-water-on-a-table-at-home.jpg?s=612x612&w=gi&k=20&c=BK5NDgjlIVJ5FYnL6zQOKRt4pYfuXa3HTolZGyOnXaw=",
    "https://media.istockphoto.com/id/929184960/video/empty-glasses-and-alcohol-drink-on-bar-counter-in-outdoor-party-at-night.jpg?s=640x640&k=20&c=luL5Ghf9TZjBCuSweuP1F7fcWUTIHZo-9e0BFeSGRGo=",
    "https://thumbs.dreamstime.com/b/many-different-alcoholic-drinks-table-against-dark-background-213141054.jpg",
  ];

  final List<Map<String, dynamic>> products = [
    {
      "image":
          "https://t4.ftcdn.net/jpg/03/33/21/15/360_F_333211562_hH0x0tAHHq0OXPPICVZ2RXFyBViS4Wib.jpg",
      "brand": "TRIGGR",
      "title": "Ultrabuds N1 Neo with EN...",
      "oldPrice": "₹2,998",
      "newPrice": "₹599",
      "delivery": "2 day delivery",
      "isSponsored": true,
    },
    {
      "image":
          "https://assets.telegraphindia.com/telegraph/2023/Jun/1686817673_liquor.jpg",
      "brand": "HOPPUP",
      "title": "AirDoze S40 Earbuds wit...",
      "oldPrice": "₹3,998",
      "newPrice": "₹599",
      "delivery": "2 day delivery",
      "isSponsored": true,
    },
    {
      "image":
          "https://t4.ftcdn.net/jpg/03/33/21/15/360_F_333211562_hH0x0tAHHq0OXPPICVZ2RXFyBViS4Wib.jpg",
      "brand": "REALME",
      "title": "Buds T110 (RMA2306) wit...",
      "oldPrice": "₹2,098",
      "newPrice": "₹1,099",
      "delivery": "1 day delivery",
      "isSponsored": false,
    },
    {
      "image":
          "https://t4.ftcdn.net/jpg/03/33/21/15/360_F_333211562_hH0x0tAHHq0OXPPICVZ2RXFyBViS4Wib.jpg",
      "brand": "ONEPLUS",
      "title": "Nord Buds 2r in Ear Earbud...",
      "oldPrice": "₹2,298",
      "newPrice": "₹1,599",
      "delivery": "2 day delivery",
      "isSponsored": false,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liquor Brooze'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag_rounded,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              /// 🔍 Search Field
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search content",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              searchController.clear();
                            });
                          },
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onChanged: (value) {
                  setState(() {}); // Update UI when typing
                },
              ),
              SizedBox(height: 16),

              /// 📌 Ensure the CarouselSlider is Visible
              SizedBox(
                height: 200, // ✅ Ensure it has height
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                  ),
                  items: liquorItems.map((item) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.broken_image,
                                size: 50, color: Colors.red),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),

              GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // ✅ 2 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // ✅ Adjust for better spacing
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(product: product);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black, // Dark background
        type: BottomNavigationBarType.fixed, // Ensures all labels are visible
        selectedItemColor: Colors.white, // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        showUnselectedLabels: true, // Show labels for inactive tabs
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            activeIcon: Icon(Icons.play_circle, color: Colors.white),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            activeIcon: Icon(Icons.grid_view, color: Colors.white),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Colors.white),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart, color: Colors.white),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🖼 Product Image with Favorite Icon
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(
                  product["image"],
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child:
                          Icon(Icons.broken_image, size: 50, color: Colors.red),
                    );
                  },
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(Icons.favorite_border, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          /// 🏷 Sponsored Tag
          if (product["isSponsored"])
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Sponsored",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ),

          /// 📌 Product Title & Brand
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product["brand"],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product["title"],
              style: const TextStyle(fontSize: 12, color: Colors.black54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 5),

          /// 💰 Price (Old & New)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${product["oldPrice"]} ",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough, // Strike-through
                    ),
                  ),
                  TextSpan(
                    text: " ${product["newPrice"]}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          /// 🚀 Delivery Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(Icons.local_shipping,
                    size: 16, color: Colors.black54),
                const SizedBox(width: 5),
                Text(
                  product["delivery"],
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
