import 'itemtemplate.dart';

final List<MenuItem> dummyMenuItems = [
  MenuItem(
    id: 'coffee_001',
    name: 'Cappuccino',
    description:
        'A classic Italian espresso-based drink, the cappuccino is crafted with equal parts espresso, steamed milk, and a thick layer of velvety milk foam. It’s bold and rich in flavor, with a smooth, creamy texture and a perfectly balanced coffee-to-milk ratio. Best served hot and enjoyed slowly.',
    imagePath: 'assets/images/cappucino.webp',
    sizePrices: {'S': 2.5, 'M': 3.5, 'L': 4.5},
    categories: ['coffee', 'hot'],
    isRecommended: true,
    rating: 4.7,
  ),
  MenuItem(
    id: 'coffee_002',
    name: 'Iced Latte',
    description:
        'A refreshing and milky espresso drink served over ice. Made by combining a double shot of espresso with chilled milk and ice cubes, the iced latte delivers a smooth, cool taste with subtle coffee notes—ideal for hot days or light caffeine cravings.',
    imagePath: 'assets/images/icedlatte.webp',
    sizePrices: {'S': 3.0, 'M': 4.0, 'L': 5.0},
    categories: ['coffee', 'cold'],
    isRecommended: false,
    rating: 4.5,
  ),
  MenuItem(
    id: 'coffee_003',
    name: 'Mocha',
    description:
        'A luxurious fusion of espresso, steamed milk, and rich chocolate syrup. Topped with a swirl of whipped cream and a sprinkle of cocoa or chocolate shavings, the mocha is perfect for those who enjoy the boldness of coffee blended with the sweetness of chocolate.',
    imagePath: 'assets/images/mocha.jpeg',
    sizePrices: {'S': 3.2, 'M': 4.2, 'L': 5.2},
    categories: ['coffee', 'hot'],
    isRecommended: true,
    rating: 4.6,
  ),
  MenuItem(
    id: 'coffee_004',
    name: 'Americano',
    description:
        'A simple yet bold beverage made by diluting a shot or two of espresso with hot water. The Americano has a smooth, rich body and a slightly more mellow flavor compared to straight espresso, making it a great choice for black coffee lovers.',
    imagePath: 'assets/images/americano.jpeg',
    sizePrices: {'S': 2.0, 'M': 2.8, 'L': 3.6},
    categories: ['coffee', 'hot'],
    isRecommended: false,
    rating: 4.2,
  ),
  MenuItem(
    id: 'coffee_005',
    name: 'Cold Brew',
    description:
        'Brewed slowly over 12–24 hours using cold water, cold brew coffee is less acidic and smoother than traditional iced coffee. It’s bold, full-bodied, and naturally sweet with a refreshing finish—served chilled, either black or with a splash of milk.',
    imagePath: 'assets/images/coldbrew.jpg',
    sizePrices: {'S': 3.5, 'M': 4.5, 'L': 5.5},
    categories: ['coffee', 'cold'],
    isRecommended: true,
    rating: 4.8,
  ),
  MenuItem(
    id: 'savory_001',
    name: 'Chicken Croissant',
    description:
        'A buttery, flaky croissant filled with tender shredded chicken, creamy mayo dressing, and fresh greens. Lightly toasted to perfection, this savory pastry is ideal for a quick breakfast or a satisfying snack on the go.',
    imagePath: 'assets/images/croissant.jpg',
    sizePrices: {'Regular': 3.5},
    categories: ['savory', 'snack'],
    isRecommended: true,
    rating: 4.8,
  ),
  MenuItem(
    id: 'savory_002',
    name: 'Veggie Wrap',
    description:
        'A healthy, colorful wrap packed with crisp lettuce, sliced cucumbers, bell peppers, carrots, and a creamy hummus or yogurt-based dressing. Wrapped in a soft tortilla, it’s a delicious and nutritious vegetarian option for lunch or a light dinner.',
    imagePath: 'assets/images/veggiewrap.jpeg',
    sizePrices: {'Regular': 3.0},
    categories: ['savory', 'vegetarian'],
    isRecommended: false,
    rating: 4.3,
  ),
  MenuItem(
    id: 'savory_003',
    name: 'Turkey Sandwich',
    description:
        'Oven-roasted turkey with lettuce and cheese in sourdough bread.',
    imagePath: 'assets/images/turkeysandwich.jpg',
    sizePrices: {'Regular': 4.0},
    categories: ['savory'],
    isRecommended: true,
    rating: 4.6,
  ),
  MenuItem(
    id: 'sweet_001',
    name: 'Chocolate Muffin',
    description:
        'A rich, moist muffin loaded with chunks of dark and semi-sweet chocolate. Baked to golden perfection with a soft interior and a slightly crispy top, it’s a chocolate lover’s dream—perfect for breakfast, dessert, or anytime indulgence.',
    imagePath: 'assets/images/chocolatemuffin.jpg',
    sizePrices: {'Regular': 2.5},
    categories: ['dessert'],
    isRecommended: true,
    rating: 4.9,
  ),
  MenuItem(
    id: 'sweet_002',
    name: 'Cinnamon Roll',
    description:
        'A fluffy, spiral-shaped pastry layered with cinnamon-sugar filling and glazed with a sweet vanilla or cream cheese icing. Served warm, it offers a gooey, aromatic bite with each pull-apart swirl—ideal with a hot cup of coffee.',
    imagePath: 'assets/images/cinnamonroll.jpg',
    sizePrices: {'Regular': 2.8},
    categories: ['dessert'],
    isRecommended: false,
    rating: 4.4,
  ),
  MenuItem(
    id: 'sweet_003',
    name: 'Cheesecake Slice',
    description:
        'A smooth and creamy slice of New York-style cheesecake with a buttery graham cracker crust. Rich and indulgent, it’s often topped with a berry compote, caramel drizzle, or served plain to let the tangy-sweet cream cheese flavor shine.',
    imagePath: 'assets/images/cheesecake.jpg',
    sizePrices: {'Regular': 3.5},
    categories: ['dessert'],
    isRecommended: true,
    rating: 4.9,
  ),
];
