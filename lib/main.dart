// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/riverpod/provider_observer.dart';
import 'package:use_riverpod/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [
        Logger(),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
