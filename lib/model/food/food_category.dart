class FoodCategory {
  final String id;
  final String label;
  final String imagePath;
  final List<FoodSubCategory> subCategories;

  FoodCategory({
    required this.id,
    required this.label,
    required this.imagePath,
    required this.subCategories,
  });
}

class FoodSubCategory {
  final String id;
  final String label;
  final bool isCustom;

  FoodSubCategory({required this.id, required this.label, this.isCustom = false});
}