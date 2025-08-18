import 'package:flutter/material.dart';

class CustomToggle extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final bool isFirstSelected;
  final Color activeColor;
  final Function(bool) onChanged;

  const CustomToggle({
    Key? key,
    required this.firstLabel,
    required this.secondLabel,
    required this.isFirstSelected,
    required this.onChanged,
    this.activeColor = const Color(0xFF2196F3), // اللون الافتراضي
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: activeColor, width: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                decoration: BoxDecoration(
                  color: isFirstSelected ? activeColor : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  firstLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    color: isFirstSelected ? Colors.white : activeColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                decoration: BoxDecoration(
                  color: !isFirstSelected ? activeColor : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  secondLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    color: !isFirstSelected ? Colors.white : activeColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
