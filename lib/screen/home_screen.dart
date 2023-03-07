import 'package:flutter/material.dart';
import 'package:use_riverpod/screen/state_notifier_provider_screen.dart';
import 'package:use_riverpod/screen/state_provider_screen.dart';
import 'package:use_riverpod/screen/future_provider_screen.dart';
import '../layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'HomeScreen',
        body: ListView(
          children: [
            ElevatedButton(
              child: const Text('StateProviderScreen'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StateProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('StateNotifierProviderScreen'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StateNotifierProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('FutureProvider'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FutureProviderScreen(),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
