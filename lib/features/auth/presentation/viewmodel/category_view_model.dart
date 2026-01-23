import 'package:fdahunter/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier{
    final List<String> _selectedCategories = [];

  List<String> get selectedCategories => _selectedCategories;

  bool isSelected(String category) {
    return _selectedCategories.contains(category);
  }

  void toggleCategory(BuildContext context, String category) {
    if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      if (_selectedCategories.length < 3) {
        _selectedCategories.add(category);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Only 3 item you can selected',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            backgroundColor: AppColor.main,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
    notifyListeners();
  }

  bool canContinue() {
    return _selectedCategories.isNotEmpty;
  }
}