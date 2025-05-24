import 'package:flutter/material.dart';
//import 'package:meals/widgets/main_drawer.dart';

enum Filter { gluttenFree, lactoseFree, vegeterian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFiltersSet = false;
  var _lactoseFreeFiltersSet = false;
  var _vegeterianFiltersSet = false;
  var _veganFiltersSet = false;

  @override
  void initState() {
    super.initState();
    _gluttenFreeFiltersSet = widget.currentFilters[Filter.gluttenFree]!;
    _lactoseFreeFiltersSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFiltersSet = widget.currentFilters[Filter.vegan]!;
    _vegeterianFiltersSet = widget.currentFilters[Filter.vegeterian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'Filters') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      //       );
      //     }
      //   },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.gluttenFree: _gluttenFreeFiltersSet,
            Filter.lactoseFree: _lactoseFreeFiltersSet,
            Filter.vegeterian: _vegeterianFiltersSet,
            Filter.vegan: _veganFiltersSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeFiltersSet = isChecked;
                });
              },
              title: Text(
                'Glutten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFiltersSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterianFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianFiltersSet = isChecked;
                });
              },
              title: Text(
                'vegeterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegeterian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFiltersSet = isChecked;
                });
              },
              title: Text(
                'vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
