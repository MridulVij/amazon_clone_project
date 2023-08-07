
import 'package:flutter/material.dart';

import 'common/widgets/bottom_bar.dart';
import 'features/address/screen/address_screen.dart';
import 'features/admin/screens/add_product_screen.dart';
import 'features/auth/screens/auth_screen.dart';
import 'features/home/screens/category_details_screen.dart';
import 'features/home/screens/home_screen.dart';
import 'features/order_details/screen/order_details.dart';
import 'features/product_details/screens/product_details_screen.dart';
import 'features/search/screens/search_screen.dart';
import 'models/order.dart';
import 'models/product.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const AuthScreen();
        }),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const HomeScreen();
        }),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const BottomBar();
        }),
      );

    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const AddProductScreen();
        }),
      );

    case CategoryDetailsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return CategoryDetailsScreen(
            category: category,
          );
        }),
      );

    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return SearchScreen(
            searchQuery: searchQuery,
          );
        }),
      );

    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return ProductDetailScreen(
            product: product,
          );
        }),
      );

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return AddressScreen(
            totalAmount: totalAmount,
          );
        }),
      );

    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return OrderDetailScreen(
            order: order,
          );
        }),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: ((_) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        }),
      );
  }
}
