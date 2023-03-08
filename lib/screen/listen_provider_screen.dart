import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  final stateMax = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('watch: ${ref.watch(listenProvider.notifier).state.toString()}');
    print('read: ${ref.read(listenProvider.notifier).state.toString()}');

    controller = TabController(
        length: stateMax,
        vsync: this,
        initialIndex: ref.read(listenProvider.notifier).state);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(listenProvider.notifier);
    ref.listen(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
      print('prev: $previous');
      print('next: $next');
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        controller: controller,
        children: List<Widget>.generate(
          stateMax,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: () {
                    state.update((state) => state == 0 ? 0 : state - 1);
                  },
                  child: const Text('Left')),
              ElevatedButton(
                  onPressed: () {
                    state.update((state) =>
                        state == stateMax - 1 ? stateMax - 1 : state + 1);
                  },
                  child: const Text('Right')),
            ],
          ),
        ),
      ),
    );
  }
}
