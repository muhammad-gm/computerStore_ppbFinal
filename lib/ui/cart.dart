import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final String imageUrl;
  final String price;
  int quantity;

  CartItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [
    CartItem(
      title: 'Asus Vivobook 14 A1404ZA Intel i3 1215U 8GB SSD 512GB',
      imageUrl: 'assets/laptop_asus.png',
      price: 'Rp. 6.000.000',
    ),
    CartItem(
      title: 'Asus Vivobook 14 A1404ZA Intel i3 1215U 8GB SSD 512GB',
      imageUrl: 'assets/laptop_asus.png',
      price: 'Rp. 6.000.000',
    ),
  ];

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222629),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222629),
        elevation: 0,
        leading: IconButton(
          icon: ColorFiltered(
            colorFilter: ColorFilter.mode(Color(0xFF86C232), BlendMode.srcIn),
            child: Image.asset('assets/Back.png'),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Color(0xFF474B4F),
            height: 1,
          ),
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Color(0xFF86C232)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: _cartItems.map((item) {
              int index = _cartItems.indexOf(item);
              return _buildCartItem(
                context,
                item,
                index,
                _incrementQuantity,
                _decrementQuantity,
                _removeItem,
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildCartItem(
    BuildContext context,
    CartItem item,
    int index,
    Function(int) onIncrement,
    Function(int) onDecrement,
    Function(int) onRemove,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 350,
      child: Stack(
        children: [
          Container(
            width: 343,
            height: 132,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF474B4F),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    item.imageUrl,
                    height: 93,
                    width: 83,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          item.title,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        item.price,
                        style: TextStyle(color: Color(0xFF86C232)),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Color(0xFF474B4F), BlendMode.srcIn),
                              child: Image.asset('assets/add.png'),
                            ),
                            onPressed: () => onDecrement(index),
                          ),
                          Text(
                            '${item.quantity}',
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            icon: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                  Color(0xFF474B4F), BlendMode.srcIn),
                              child: Image.asset('assets/min.png'),
                            ),
                            onPressed: () => onIncrement(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 2,
            right: 5,
            child: IconButton(
              icon: ColorFiltered(
                colorFilter:
                    ColorFilter.mode(Color(0xFF474B4F), BlendMode.srcIn),
                child: Image.asset('assets/delete.png'),
              ),
              onPressed: () => onRemove(index),
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF222629),
      selectedItemColor: const Color(0xFF86C232),
      unselectedItemColor: const Color(0xff474B4F),
      currentIndex: 1,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/homepage");
            break;
          case 1:
            Navigator.pushNamed(context, "/cart");
            break;
          case 2:
            Navigator.pushNamed(context, "/orders");
            break;
          case 3:
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
            AssetImage('assets/icon_Home_2.png'),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/cart_fill.png'),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/order.png'), // Path to your asset image
          ),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/profil.png'), // Path to your asset image
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
