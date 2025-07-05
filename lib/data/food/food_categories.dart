import '../../model/food/food_category.dart';
import '../../utilities/images/app_images.dart';

class FoodCategoriesData {
  static List<FoodCategory> getMainCategories() {
    return <FoodCategory>[
      FoodCategory(
        id: 'meat',
        label: 'Meat',
        imagePath: AppImages.categoryMeat,
        subCategories: <FoodSubCategory>[
          // Poultry
          FoodSubCategory(id: 'chicken', label: 'Chicken'),
          FoodSubCategory(id: 'turkey', label: 'Turkey'),
          FoodSubCategory(id: 'duck', label: 'Duck'),
          FoodSubCategory(id: 'goose', label: 'Goose'),
          FoodSubCategory(id: 'quail', label: 'Quail'),
          // Red Meat
          FoodSubCategory(id: 'beef', label: 'Beef'),
          FoodSubCategory(id: 'mutton', label: 'Mutton'),
          FoodSubCategory(id: 'lamb', label: 'Lamb'),
          FoodSubCategory(id: 'pork', label: 'Pork'),
          FoodSubCategory(id: 'veal', label: 'Veal'),
          FoodSubCategory(id: 'goat', label: 'Goat'),
          // Game & Others
          FoodSubCategory(id: 'rabbit', label: 'Rabbit'),
          FoodSubCategory(id: 'venison', label: 'Venison'),
          FoodSubCategory(id: 'ham', label: 'Ham'),
          FoodSubCategory(id: 'bacon', label: 'Bacon'),
          FoodSubCategory(id: 'sausage', label: 'Sausage'),
          FoodSubCategory(id: 'custom_meat', label: 'Other', isCustom: true),
        ],
      ),
      FoodCategory(
        id: 'fish',
        label: 'Fish',
        imagePath: AppImages.categoryFish,
        subCategories: <FoodSubCategory>[
          // Popular Fish
          FoodSubCategory(id: 'salmon', label: 'Salmon'),
          FoodSubCategory(id: 'tuna', label: 'Tuna'),
          FoodSubCategory(id: 'cod', label: 'Cod'),
          FoodSubCategory(id: 'tilapia', label: 'Tilapia'),
          FoodSubCategory(id: 'mackerel', label: 'Mackerel'),
          FoodSubCategory(id: 'sardine', label: 'Sardine'),
          FoodSubCategory(id: 'trout', label: 'Trout'),
          FoodSubCategory(id: 'bass', label: 'Bass'),
          FoodSubCategory(id: 'snapper', label: 'Snapper'),
          FoodSubCategory(id: 'halibut', label: 'Halibut'),
          // Shellfish
          FoodSubCategory(id: 'shrimp', label: 'Shrimp'),
          FoodSubCategory(id: 'crab', label: 'Crab'),
          FoodSubCategory(id: 'lobster', label: 'Lobster'),
          FoodSubCategory(id: 'oyster', label: 'Oyster'),
          FoodSubCategory(id: 'clam', label: 'Clam'),
          FoodSubCategory(id: 'mussel', label: 'Mussel'),
          FoodSubCategory(id: 'scallop', label: 'Scallop'),
          FoodSubCategory(id: 'squid', label: 'Squid'),
          FoodSubCategory(id: 'octopus', label: 'Octopus'),
          FoodSubCategory(id: 'custom_fish', label: 'Other', isCustom: true),
        ],
      ),
      FoodCategory(
        id: 'fruits',
        label: 'Fruits',
        imagePath: AppImages.categoryFruit,
        subCategories: <FoodSubCategory>[
          // Common Fruits
          FoodSubCategory(id: 'apple', label: 'Apple'),
          FoodSubCategory(id: 'banana', label: 'Banana'),
          FoodSubCategory(id: 'orange', label: 'Orange'),
          FoodSubCategory(id: 'grapes', label: 'Grapes'),
          FoodSubCategory(id: 'strawberry', label: 'Strawberry'),
          FoodSubCategory(id: 'blueberry', label: 'Blueberry'),
          FoodSubCategory(id: 'raspberry', label: 'Raspberry'),
          FoodSubCategory(id: 'blackberry', label: 'Blackberry'),
          // Citrus
          FoodSubCategory(id: 'lemon', label: 'Lemon'),
          FoodSubCategory(id: 'lime', label: 'Lime'),
          FoodSubCategory(id: 'grapefruit', label: 'Grapefruit'),
          FoodSubCategory(id: 'tangerine', label: 'Tangerine'),
          // Stone Fruits
          FoodSubCategory(id: 'peach', label: 'Peach'),
          FoodSubCategory(id: 'plum', label: 'Plum'),
          FoodSubCategory(id: 'apricot', label: 'Apricot'),
          FoodSubCategory(id: 'cherry', label: 'Cherry'),
          // Tropical
          FoodSubCategory(id: 'mango', label: 'Mango'),
          FoodSubCategory(id: 'pineapple', label: 'Pineapple'),
          FoodSubCategory(id: 'papaya', label: 'Papaya'),
          FoodSubCategory(id: 'kiwi', label: 'Kiwi'),
          FoodSubCategory(id: 'avocado', label: 'Avocado'),
          FoodSubCategory(id: 'coconut', label: 'Coconut'),
          // Melons
          FoodSubCategory(id: 'watermelon', label: 'Watermelon'),
          FoodSubCategory(id: 'cantaloupe', label: 'Cantaloupe'),
          FoodSubCategory(id: 'honeydew', label: 'Honeydew'),
          // Others
          FoodSubCategory(id: 'pear', label: 'Pear'),
          FoodSubCategory(id: 'pomegranate', label: 'Pomegranate'),
          FoodSubCategory(id: 'fig', label: 'Fig'),
          FoodSubCategory(id: 'date', label: 'Date'),
          FoodSubCategory(id: 'custom_fruit', label: 'Other', isCustom: true),
        ],
      ),
      FoodCategory(
        id: 'vegetables',
        label: 'Vegetables',
        imagePath: AppImages.categoryVegetable,
        subCategories: <FoodSubCategory>[
          // Root Vegetables
          FoodSubCategory(id: 'carrot', label: 'Carrot'),
          FoodSubCategory(id: 'potato', label: 'Potato'),
          FoodSubCategory(id: 'sweet_potato', label: 'Sweet Potato'),
          FoodSubCategory(id: 'beet', label: 'Beet'),
          FoodSubCategory(id: 'radish', label: 'Radish'),
          FoodSubCategory(id: 'turnip', label: 'Turnip'),
          FoodSubCategory(id: 'parsnip', label: 'Parsnip'),
          // Leafy Greens
          FoodSubCategory(id: 'spinach', label: 'Spinach'),
          FoodSubCategory(id: 'lettuce', label: 'Lettuce'),
          FoodSubCategory(id: 'kale', label: 'Kale'),
          FoodSubCategory(id: 'arugula', label: 'Arugula'),
          FoodSubCategory(id: 'chard', label: 'Chard'),
          FoodSubCategory(id: 'cabbage', label: 'Cabbage'),
          FoodSubCategory(id: 'bok_choy', label: 'Bok Choy'),
          // Cruciferous
          FoodSubCategory(id: 'broccoli', label: 'Broccoli'),
          FoodSubCategory(id: 'cauliflower', label: 'Cauliflower'),
          FoodSubCategory(id: 'brussels_sprouts', label: 'Brussels Sprouts'),
          // Nightshades
          FoodSubCategory(id: 'tomato', label: 'Tomato'),
          FoodSubCategory(id: 'bell_pepper', label: 'Bell Pepper'),
          FoodSubCategory(id: 'eggplant', label: 'Eggplant'),
          // Squash
          FoodSubCategory(id: 'zucchini', label: 'Zucchini'),
          FoodSubCategory(id: 'cucumber', label: 'Cucumber'),
          FoodSubCategory(id: 'pumpkin', label: 'Pumpkin'),
          FoodSubCategory(id: 'butternut_squash', label: 'Butternut Squash'),
          // Alliums
          FoodSubCategory(id: 'onion', label: 'Onion'),
          FoodSubCategory(id: 'garlic', label: 'Garlic'),
          FoodSubCategory(id: 'leek', label: 'Leek'),
          FoodSubCategory(id: 'shallot', label: 'Shallot'),
          // Legumes
          FoodSubCategory(id: 'green_beans', label: 'Green Beans'),
          FoodSubCategory(id: 'peas', label: 'Peas'),
          FoodSubCategory(id: 'snow_peas', label: 'Snow Peas'),
          // Others
          FoodSubCategory(id: 'celery', label: 'Celery'),
          FoodSubCategory(id: 'asparagus', label: 'Asparagus'),
          FoodSubCategory(id: 'mushroom', label: 'Mushroom'),
          FoodSubCategory(id: 'corn', label: 'Corn'),
          FoodSubCategory(id: 'artichoke', label: 'Artichoke'),
          FoodSubCategory(id: 'okra', label: 'Okra'),
          FoodSubCategory(id: 'celery', label: 'Celery'),
          FoodSubCategory(id: 'asparagus', label: 'Asparagus'),
          FoodSubCategory(id: 'mushroom', label: 'Mushroom'),
          FoodSubCategory(id: 'corn', label: 'Corn'),
          FoodSubCategory(id: 'artichoke', label: 'Artichoke'),
          FoodSubCategory(id: 'okra', label: 'Okra'),
          FoodSubCategory(id: 'celery', label: 'Celery'),
          FoodSubCategory(id: 'asparagus', label: 'Asparagus'),
          FoodSubCategory(id: 'mushroom', label: 'Mushroom'),
          FoodSubCategory(id: 'corn', label: 'Corn'),
          FoodSubCategory(id: 'artichoke', label: 'Artichoke'),
          FoodSubCategory(id: 'okra', label: 'Okra'),
          FoodSubCategory(id: 'custom_vegetable', label: 'Other', isCustom: true),
        ],
      ),
      FoodCategory(
        id: 'drinks',
        label: 'Drinks',
        imagePath: AppImages.categoryDrinks,
        subCategories: <FoodSubCategory>[
          // Basic Beverages
          FoodSubCategory(id: 'water', label: 'Water'),
          FoodSubCategory(id: 'milk', label: 'Milk'),
          FoodSubCategory(id: 'breast_milk', label: 'Breast Milk'),
          FoodSubCategory(id: 'formula', label: 'Formula'),
          // Juices
          FoodSubCategory(id: 'apple_juice', label: 'Apple Juice'),
          FoodSubCategory(id: 'orange_juice', label: 'Orange Juice'),
          FoodSubCategory(id: 'grape_juice', label: 'Grape Juice'),
          FoodSubCategory(id: 'cranberry_juice', label: 'Cranberry Juice'),
          FoodSubCategory(id: 'pineapple_juice', label: 'Pineapple Juice'),
          FoodSubCategory(id: 'tomato_juice', label: 'Tomato Juice'),
          FoodSubCategory(id: 'vegetable_juice', label: 'Vegetable Juice'),

          // Hot Beverages
          FoodSubCategory(id: 'tea', label: 'Tea'),
          FoodSubCategory(id: 'herbal_tea', label: 'Herbal Tea'),
          FoodSubCategory(id: 'coffee', label: 'Coffee'),
          FoodSubCategory(id: 'hot_chocolate', label: 'Hot Chocolate'),
          // Plant-based Milk
          FoodSubCategory(id: 'almond_milk', label: 'Almond Milk'),
          FoodSubCategory(id: 'soy_milk', label: 'Soy Milk'),
          FoodSubCategory(id: 'oat_milk', label: 'Oat Milk'),
          FoodSubCategory(id: 'coconut_milk', label: 'Coconut Milk'),
          FoodSubCategory(id: 'rice_milk', label: 'Rice Milk'),
          // Sports & Energy
          FoodSubCategory(id: 'sports_drink', label: 'Sports Drink'),
          FoodSubCategory(id: 'energy_drink', label: 'Energy Drink'),
          // Others
          FoodSubCategory(id: 'soda', label: 'Soda'),
          FoodSubCategory(id: 'coconut_water', label: 'Coconut Water'),
          FoodSubCategory(id: 'kombucha', label: 'Kombucha'),
          FoodSubCategory(id: 'custom_drink', label: 'Other', isCustom: true),
        ],
      ),
    ];
  }
}

class ReactionCategoriesData {
  static List<ReactionCategory> reactions = <ReactionCategory>[
    ReactionCategory(id: 'love_it', label: "Love It", imagePath: AppImages.loveItReaction),
    ReactionCategory(id: 'like_it', label: 'Liked it', imagePath: AppImages.likeItReaction),
    ReactionCategory(id: 'hate_it', label: 'Hated it', imagePath: AppImages.hateItReaction),
    ReactionCategory(
      id: 'allergic',
      label: 'Allergic to it',
      imagePath: AppImages.allergicItReaction,
    ),
  ];
}

class ReactionCategory {
  final String id;
  final String label;
  final String imagePath;

  ReactionCategory({required this.id, required this.label, required this.imagePath});
}
