class MenuItem {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final Map<String, double> sizePrices; // e.g., {'S': 3.0, 'M': 4.0, 'L': 5.0}
  final List<String> categories; // e.g., ['coffee', 'hot']
  final bool isRecommended;
  final double rating;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.sizePrices,
    required this.categories,
    this.isRecommended = false,
    this.rating = 0.0,
  });
}
