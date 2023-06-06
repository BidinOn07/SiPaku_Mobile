import 'package:flutter/material.dart';

import '../utils/helpers/app_helpers.dart';

class OverViewHeader extends StatelessWidget {
  const OverViewHeader({
    required this.onSelected,
    this.axis = Axis.horizontal,
    Key? key,
  }) : super(key: key);

  final Function(TaskType? task) onSelected;
  final Axis axis;
  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? const Row(
            children: [
              Text(
                "Selamat Datang",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Spacer(),
            ],
          )
        : const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Datang",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              ),
            ],
          );
  }
}
