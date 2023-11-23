import 'package:flutter/material.dart';
import 'package:ftests/api_test/home.dart';
import 'package:ftests/counter_app/home_page.dart';
import 'package:ftests/models/favourite.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'screens/favorites.dart';

void main() {
  runApp(const TestingApp());
}

// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: HomePage.routeName,
//       builder: (context, state) {
//         return const HomePage();
//       },
//       routes: [
//         GoRoute(
//           path: FavoritesPage.routeName,
//           builder: (context, state) {
//             return const FavoritesPage();
//           },
//         ),
//       ],
//     ),
//   ],
// );

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
        create: (context) => Favorites(),
        child: const MaterialApp(home: HomePage()));
  }
}
// MaterialApp.router(
//         title: 'Testing Sample',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           useMaterial3: true,
//         ),
//         routerConfig: _router,
//       ),