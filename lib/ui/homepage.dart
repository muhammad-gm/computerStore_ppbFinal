import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final List<Product> products = [
    Product(1, 'Product 1', 'assets/laptop_asus.png', 29.99),
    Product(2, 'Product 2', 'assets/keyboard_robot.jpg', 29.99),
    Product(3, 'Product 3', 'assets/monitor_samsung.jpg', 29.99),
    Product(4, 'Product 4', 'assets/office.jpg', 29.99),
    Product(5, 'Product 5', 'assets/gamepad.png', 29.99),
    Product(6, 'Product 6', 'assets/tower_acer.jpg', 29.99),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222629),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF222629),
        elevation: 0,
        leading: Container(),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Color(0xFF474B4F),
            height: 1,
          ),
        ),
        title: Text(
          'Online Computer Store',
          style: TextStyle(color: Color(0xFF86C232)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFF222629),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0xFF474B4F)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Product',
                    hintStyle: TextStyle(color: Color(0xffC4C5C4)),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Color(0xffC4C5C4)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Category",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF222629),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryIcon(
                          context, 'assets/Desktop.png', 'Monitor'),
                      _buildCategoryIcon(
                          context, 'assets/Printer.png', 'Printer'),
                      _buildCategoryIcon(context,
                          'assets/External_hard_drive.png', 'Data Storage'),
                      _buildCategoryIcon(
                          context, 'assets/Laptop.png', 'Laptop'),
                      _buildCategoryIcon(
                          context, 'assets/Mouse.png', 'Computer Accessories'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryIcon(
                          context, 'assets/Headphones.png', 'Speaker & Audio'),
                      _buildCategoryIcon(context, 'assets/Console.png',
                          'PC Gaming Accessories'),
                      _buildCategoryIcon(
                          context, 'assets/Projector.png', 'Projector'),
                      _buildCategoryIcon(
                          context, 'assets/Word.png', 'Software'),
                      _buildCategoryIcon(
                          context, 'assets/Network.png', 'Computer Components'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Sellers",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "See More",
                        style: TextStyle(color: Color(0xFF86C232)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 80),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF222629),
        selectedItemColor: const Color(0xFF86C232),
        unselectedItemColor: const Color(0xff474B4F),
        currentIndex: 0,
        onTap: (int index) {
          switch (index) {
            case 0:
              // Navigate to Home page
              Navigator.pushNamed(context, "/homepage");
              break;
            case 1:
              // Navigate to Cart page
              Navigator.pushNamed(context, "/cart");
              break;
            case 2:
              // Navigate to Orders page
              Navigator.pushNamed(context, "/orders");
              break;
            case 3:
              // Navigate to Profile page
              Navigator.pushNamed(context, "/profile");
              break;
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icon_Home_.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/keranjang.png'),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/order.png'),
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/profil.png'),
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryIcon(
    BuildContext context, String assetName, String label) {
  return GestureDetector(
    onTap: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Clicked on $label')));
    },
    child: Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF222629),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: const Color(0xff474B4F),
              width: 2.0,
            ),
          ),
          child: Image.asset(assetName),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 70,
          height: 50,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

class Product {
  final int id;
  final String name;
  final String imagePath;
  final double price;

  Product(this.id, this.name, this.imagePath, this.price);
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF474B4F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.product.imagePath,
                fit: BoxFit.cover,
                height: 110,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.product.name,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 5),
            Text(
              '\$Rp. ${widget.product.price.toStringAsFixed(2)}',
              style: const TextStyle(color: Color(0xFF86C232), fontSize: 12),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 24,
                width: 74,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/detail");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF86C232),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
