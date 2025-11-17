import 'package:flutter/material.dart';

class MinerDropdown extends StatefulWidget {
  const MinerDropdown(
      {super.key,
      required this.selectedItem,
      required this.items,
      required this.textColor,
      this.onChanged,
      this.fontSize = 12});
  final String selectedItem;
  final List<String> items;
  final Color textColor;
  final double fontSize;
  final Function(String? value)? onChanged;
  @override
  State<MinerDropdown> createState() => _MinerDropdownState();
}

class _MinerDropdownState extends State<MinerDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 110,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              focusColor: Colors.transparent,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor,
              ),
              value: widget.selectedItem,
              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(item),
                        ),
                      ))
                  .toList(),
              onChanged: (item) {
                if (widget.onChanged == null) return;
                widget.onChanged!(item);
              }),
        ),
      ),
    );
  }
}
