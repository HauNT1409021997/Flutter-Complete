import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/filter_provider.dart';

class Filters extends ConsumerWidget {
  bool _gluttoFreeFilterSet = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProdiver);
    Widget mainContent = Scaffold(
      appBar: AppBar(
        title: Text("Filter Meals"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.keyboard_return),
          )
        ],
      ),
      body: Column(
        children: [
          SwitchListTile(
            onChanged: (isChecked) {
              ref
                  .read(filterProdiver.notifier)
                  .setFilter(Filter.isGlutenFree, isChecked);
            },
            value: activeFilter[Filter.isGlutenFree]!,
            title: Text(
              'Glutton-Free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            subtitle: Text(
              'Only Glutton Free',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
    // TODO: implement build
    return mainContent;
  }
}
