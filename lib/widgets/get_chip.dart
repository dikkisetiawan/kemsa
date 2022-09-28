import 'package:flutter/material.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';

class GetChip extends StatefulWidget {
  var name;
  var selected_values = [];

  GetChip(this.name);

  @override
  State<GetChip> createState() => _GetChipState();
}

class _GetChipState extends State<GetChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: EdgeInsets.all(8.0),
      checkmarkColor: LightColor.background,
      selected: widget.selected_values.contains(widget.name),
      selectedColor: LightColor.mainPink,
      disabledColor: LightColor.grey,
      labelStyle: widget.selected_values.contains(widget.name)
          ? TextStyle(fontSize: 16, color: LightColor.background)
          : AppTheme.h5Style,
      label: Text('${widget.name}'),
      onSelected: (value) {
        setState(() {
          widget.selected_values.contains(widget.name)
              ? widget.selected_values.remove(widget.name)
              : widget.selected_values.add(widget.name);
        });
      },
    );
  }
}
