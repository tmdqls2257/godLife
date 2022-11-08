import 'package:flutter/material.dart';

import '../../shared/shared.dart';
import '../meeting_model.dart';

class EventCard extends StatelessWidget {
  final MyEvents myEvents;

  const EventCard({
    Key? key,
    required this.myEvents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: customColor[ColorType.orange]!),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: customW[CustomW.w4],
      child: Row(
        children: [
          Container(
            width: 19,
            height: 60,
            decoration: BoxDecoration(
              color: customColor[ColorType.orange],
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Event Title:   ${myEvents.eventTitle}'),
              CustomText(text: 'Description:   ${myEvents.eventDescp}')
            ],
          ),
        ],
      ),
    );
  }
}
