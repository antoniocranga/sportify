import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportify/src/utils/routes.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';

class SelectScreen extends HookConsumerWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = [
      {
        "title": "Football",
        "subtitle": "List all leagues with seasons.",
        "route": Routes.football,
        "url":
            "https://images.unsplash.com/photo-1553778263-73a83bab9b0c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80"
      },
      {
        "title": "Basketball",
        "subtitle": "List all leagues with seasons.",
        "route": Routes.basketball,
        "url":
            "https://images.unsplash.com/photo-1515523110800-9415d13b84a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
      },
    ];
    return Column(
      children: [
        ...screens.map<Widget>((screen) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, screen["route"]!),
              child: Card(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        screen["url"]!,
                        height: 200,
                        width: 100.0.cw,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          gradient: const LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [
                                0.5,
                                1.0
                              ])),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(screen["title"]!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                          Text(screen["subtitle"]!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
