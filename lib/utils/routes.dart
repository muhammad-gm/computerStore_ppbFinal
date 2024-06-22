import 'package:flutter/material.dart';
import 'package:online_computer_store/ui/add_address.dart';
import 'package:online_computer_store/ui/address.dart';
import 'package:online_computer_store/ui/cart.dart';
import 'package:online_computer_store/ui/detail.dart';
import 'package:online_computer_store/ui/homepage.dart';
import 'package:online_computer_store/ui/invoice.dart';
import 'package:online_computer_store/ui/landing_page.dart';
import 'package:online_computer_store/ui/login.dart';
import 'package:online_computer_store/ui/order.dart';
import 'package:online_computer_store/ui/payment.dart';
import 'package:online_computer_store/ui/profile.dart';
import 'package:online_computer_store/ui/register.dart';
import 'package:online_computer_store/ui/success.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const LandingPage(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/homepage': (context) => HomePage(),
    '/detail': (context) => const detailPage(),
    '/cart': (context) => const CartPage(),
    '/address': (context) => const addressPage(),
    '/payment': (context) => const paymentPage(),
    '/success': (context) => const SuccessPage(),
    '/profile': (context) => const profilePage(),
    '/add_address': (context) => const addAddress(),
    '/orders': (context) => const orderPage(),
    '/invoice': (context) => const invoicePage(),
  };
}
