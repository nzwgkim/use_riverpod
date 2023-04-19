import 'package:flutter/material.dart';
import 'package:use_riverpod/screen/provider_screen.dart';
import 'package:use_riverpod/screen/select_provider_screen.dart';
import 'package:use_riverpod/screen/state_notifier_provider_screen.dart';
import 'package:use_riverpod/screen/state_provider_screen.dart';
import 'package:use_riverpod/screen/async/future_provider_screen.dart';
import 'package:use_riverpod/screen/async/stream_provider_screen.dart';
import '../layout/default_layout.dart';
import 'auto_dispose_modifier_screen.dart';
import 'code_generation_screen.dart';
import 'family_modifier_screen.dart';
import 'stateful/listen_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextStyle style = const TextStyle(fontSize: 24);
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: 'HomeScreen',
        body: ListView(
          children: [
            ElevatedButton(
              child: Text(
                'StateProviderScreen',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StateProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'StateNotifierProviderScreen',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StateNotifierProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'FutureProvider',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FutureProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'StreamProvider',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StreamProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'FamilyModifier',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FamilyModifierScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'AutoDisposeModifierScreen',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AutoDisposeModifierScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'ListenProviderScreen',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListenProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'SelectProviderScreen',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SelectProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'ProviderScreen',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProviderScreen(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(
                'CodeGenerationScreen',
                style: style,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CodeGenerationScreen(),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
