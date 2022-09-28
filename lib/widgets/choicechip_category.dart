import 'package:flutter/material.dart';
import 'package:kemsa/widgets/get_chip.dart';
import '../themes/light_color.dart';
import '../themes/theme.dart';

class ChoiceChipCategory extends StatefulWidget {
  const ChoiceChipCategory({super.key});

  @override
  State<ChoiceChipCategory> createState() => _ChoiceChipCategoryState();
}

class _ChoiceChipCategoryState extends State<ChoiceChipCategory> {
  var categories = [
    "love",
    "instagood",
    "photooftheday",
    "beautiful",
    "fashion",
    "happy",
    "tbt",
    "cute",
    "followme",
    "like4like",
    "follow",
    "picoftheday",
    "me",
    "selfie",
    "summer",
    "instadaily"
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0,
      children: [...generate_choiceChip()],
    );
  }

  List generate_choiceChip() {
    return categories.map((value) => GetChip(value)).toList();
  }
}
