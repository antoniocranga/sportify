import 'package:flutter/material.dart';
import 'package:sportify/src/models/football/event/event.dart';
import 'package:sportify/src/utils/sizes_and_orientation.dart';
import 'package:sportify/src/widgets/football/types/event_card_widget.dart';
import 'package:sportify/src/widgets/football/types/event_goal_widget.dart';
import 'package:sportify/src/widgets/football/types/event_substitution_widget.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    switch (event.type) {
      case 'subst':
        return EventSubstitutionWidget(event: event);
      case 'Goal':
        return EventGoalWidget(event: event);
      case 'Card':
      case 'card':
        return EventCardWidget(event: event);
      case 'Var':
      case 'var':
        return ListTile();
      default:
        return ListTile();
    }
  }
}
