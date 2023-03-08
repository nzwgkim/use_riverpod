import 'package:flutter/material.dart';
import 'package:use_riverpod/screen/state_notifier_provider_screen.dart';
import 'package:use_riverpod/screen/state_provider_screen.dart';
import 'package:use_riverpod/screen/future_provider_screen.dart';
import 'package:use_riverpod/screen/stream_provider_screen.dart';
import '../layout/default_layout.dart';
import 'auto_dispose_modifier_screen.dart';
import 'family_modifier_screen.dart';
import 'listen_provider_screen.dart';

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
            ElevatedButton(
              child: const Text('StreamProvider'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StreamProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('FamilyModifier'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FamilyModifierScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('AutoDisposeModifierScreen'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AutoDisposeModifierScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('ListenProviderScreen'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListenProviderScreen(),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
