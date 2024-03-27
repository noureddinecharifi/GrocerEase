import 'package:flutter/material.dart';

class RowContainers extends StatelessWidget {
  const RowContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background),
          child: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [Icon(Icons.motorcycle_outlined), Text('30 min')],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background),
          child: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [Icon(Icons.center_focus_weak), Text('30 min')],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              children: [Icon(Icons.map_outlined), Text('30 min')],
            ),
          ),
        ),
      ],
    );
  }
}
