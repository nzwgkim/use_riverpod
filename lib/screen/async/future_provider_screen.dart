import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';

import '../../riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<int>> numbers = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'FutureProvider',
      body:
          // numbers.when(
          //   data: (data) => Text(
          //     data.toString(),
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(fontSize: 20),
          //   ),
          //   error: (err, stack) => Text('Error: $err'),
          //   loading: () => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // ),

          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          numbers.when(
            data: (data) => Text(
              data.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
            error: (err, stack) => Text('Error: $err'),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
