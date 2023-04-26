import 'package:flutter/material.dart';
import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';

class EventSubstitutionWidget extends StatelessWidget {
  final Event event;
  const EventSubstitutionWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          ListTile(
            title: Text(event.detail ?? ""),
            subtitle: Text("min ${event.time.elapsed}"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.cw),
            child: Row(
              children: [
                if (event.team.logo != null)
                  Container(
                    width: 50,
                    margin: EdgeInsets.only(right: 2.0.cw),
                    child: Image.network(event.team.logo!),
                  ),
                Expanded(
                  child: Text(
                    event.player?.name ?? "Unknown",
                    textAlign: TextAlign.end,
                  ),
                ),
                const Expanded(
                  child: Icon(Icons.swap_horiz_outlined),
                ),
                Expanded(
                  child: Text(
                    event.assist?.name ?? "Unknown",
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
