import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:belanja_application/pages/item_page.dart';
import 'package:belanja_application/pages/home_page.dart';
import 'package:belanja_application/models/item.dart';

void main() {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/item',
        builder: (context, state) {
          final Item item = state.extra as Item;
          return ItemPage(item: item); // Pass item to ItemPage constructor
        },
        // Automatically add a back button in AppBar
        pageBuilder: (context, state) {
          return MaterialPage(child: ItemPage(item: state.extra as Item));
        },
      ),
    ],
  );

  runApp(MyApp(router: _router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  MyApp({required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shopping List',
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
