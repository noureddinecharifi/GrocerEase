import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import '../utils/theme.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
              
          const SizedBox(height: 32),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        width: 2,
                        color: Colors.grey.shade50.withOpacity(0.3)),
                    color: Theme.of(context).colorScheme.background),
                child: SwitchListTile(
                  title: Row(
                    children: [
                      Icon(
                        themeProvider.themeData == lightTheme
                            ? Icons.wb_sunny
                            : Icons.nightlight_round,
                        color: themeProvider.themeData == lightTheme
                            ? Colors.orange
                            : Colors.blue,
                      ),
                      const SizedBox(width: 32),
                      Text(
                        themeProvider.themeData == lightTheme
                            ? 'Light Mode'
                            : 'Dark Mode',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.themeData == lightTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                  value: themeProvider.themeData == darkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 12.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 2,
                      color: Colors.grey.shade50.withOpacity(0.3)),
                  color: Theme.of(context).colorScheme.background),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 32),
                    Text('About Salati',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(fontSize: 16)),
                  ],
                ),
              ),
            ),
          )
        ]);
  }
}
