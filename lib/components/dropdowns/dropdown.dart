import 'package:flutter/material.dart';
import 'package:my_task/responsiveness/responsive.dart';
import 'package:my_task/responsiveness/task_font_style.dart';
import 'package:my_task/theme/colors.dart';

class TaskDropdown extends StatefulWidget {
  const TaskDropdown({
    super.key,
    required this.onTap,
    required this.width,
    this.height = 200,
    required this.elements,
    required this.label,
    required this.textController,
  });
  final double width;
  final double height;
  final List<String> elements;
  final String label;
  final TextEditingController textController;
  final Function(String value) onTap;
  @override
  State<TaskDropdown> createState() => _TaskDropdownState();
}

class _TaskDropdownState extends State<TaskDropdown> {
  @override
  Widget build(BuildContext context) {
    final fontStyle =
        widget.textController.text.isEmpty
            ? TaskFontStyle.h4Bold.copyWith(
              color: secondaryFocusColor.withValues(alpha: 0.4),
            )
            : TaskFontStyle.h4Bold.copyWith(color: secondaryFocusColor);
    return MenuAnchor(
      alignmentOffset: const Offset(0, 4),
      style: const MenuStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero)),
      builder:
          (context, controller, child) => InkWell(
            onTap: () {
              setState(() {
                if (controller.isOpen) {
                  controller.close();
                  return;
                }
                controller.open();
              });
            },
            child: Container(
              height: Responsive.getSizeValue(44),
              decoration: BoxDecoration(
                color: secondaryColor,
                border: Border(
                  bottom: BorderSide(color: primaryColor, width: 1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.textController.text.isEmpty
                        ? widget.label
                        : widget.textController.text,
                    style: fontStyle,
                  ),
                  AnimatedRotation(
                    turns: controller.isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: Icon(
                      Icons.expand_more,
                      size: 20,
                      color:
                          widget.textController.text.isEmpty
                              ? primaryFocusColor
                              : secondaryFocusColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
      menuChildren: [
        Material(
          child: Container(
            alignment: Alignment.center,
            height: widget.height,
            width: widget.width,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListView.builder(
              primary: false,
              itemCount: widget.elements.length,
              itemBuilder:
                  (context, index) => MenuItemButton(
                    onPressed: () async {
                      setState(() {
                        widget.textController.text = widget.elements[index];
                        widget.onTap(widget.elements[index]);
                      });
                    },
                    child: ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      dense: true,
                      selectedTileColor: primaryColor.withValues(alpha: 0.1),
                      selectedColor: primaryColor,
                      selected:
                          widget.textController.text == widget.elements[index],
                      title: Text(
                        widget.elements[index],
                        style: TaskFontStyle.titleBold,
                      ),
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
