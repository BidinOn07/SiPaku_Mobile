import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final dynamic value;
  final dynamic groupValue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IgnorePointer(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Radio(
              activeColor: Colors.blue,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: value,
              groupValue: groupValue,
              onChanged: (value) {},
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
