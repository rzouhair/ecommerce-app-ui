import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterButton extends StatefulWidget {
  const FilterButton(
      {Key? key, required this.label, this.isSelected, this.onPress})
      : super(key: key);

  final String label;
  final bool? isSelected;
  final void Function()? onPress;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPress!();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Text(
          widget.label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: widget.isSelected != null && widget.isSelected == true
                ? Colors.black
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
