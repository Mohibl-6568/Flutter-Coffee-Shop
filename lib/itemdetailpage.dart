import 'package:flutter/material.dart';
import 'itemtemplate.dart';
import 'cartitem.dart'; // Assuming Cartitem is defined here and the global 'cart' list is accessible

class ItemDetailPage extends StatefulWidget {
  final MenuItem item;

  const ItemDetailPage({super.key, required this.item});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int quantity = 1;
  String selectedSize = '';

  // This function creates a Cartitem object based on current selections
  Cartitem cartinput() {
    final double price = widget.item.sizePrices[selectedSize]!;
    return Cartitem(
      item: widget.item,
      size: selectedSize,
      quantity: quantity,
      price: price * quantity, // Store total price for this item
    );
  }

  @override
  void initState() {
    super.initState();
    selectedSize = widget.item.sizePrices.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final pricePerItem = widget.item.sizePrices[selectedSize]!;
    final totalPrice = pricePerItem * quantity;

    return Scaffold(
      backgroundColor: const Color(
        0xFF120C08,
      ), // Deep coffee brown/black for dark theme
      body: Stack(
        children: [
          // Background Image with subtle gradient overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height:
                screenHeight *
                0.48, // Slightly reduced image height to give more space to details
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF120C08), // Blend with the dark background
                  ],
                  stops: const [0.05, 1.0],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(widget.item.imagePath, fit: BoxFit.cover),
            ),
          ),

          // Back Button
          Positioned(
            top:
                MediaQuery.of(context).padding.top +
                20, // Increased top padding
            left: 20, // Increased left padding
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10), // Increased padding
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(
                    0.5,
                  ), // Darker, semi-transparent
                  shape: BoxShape.circle,
                  boxShadow: [
                    // Subtle shadow
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white, // White icon for contrast
                  size: 24, // Slightly larger icon
                ),
              ),
            ),
          ),

          // Details Container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height:
                screenHeight *
                0.68, // Increased height to give more space for description
            child: Container(
              padding: const EdgeInsets.all(28), // Increased padding
              decoration: BoxDecoration(
                color: const Color(
                  0xFF2C2018,
                ), // Darker brown for details container
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35), // More rounded
                  topRight: Radius.circular(35), // More rounded
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4), // Stronger shadow
                    blurRadius: 15,
                    offset: const Offset(0, -8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 70, // Wider drag indicator
                      height: 6, // Thicker drag indicator
                      decoration: BoxDecoration(
                        color:
                            Colors.white12, // Subtle white for drag indicator
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25), // More space
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      color: Colors.white, // White for the title
                      fontSize: 32, // Larger font size
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0, // Increased letter spacing
                    ),
                  ),
                  const SizedBox(height: 10), // More space
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: 26, // Larger star
                      ),
                      const SizedBox(width: 10), // More space
                      const Text(
                        '4.5 (120 reviews)', // Static for now, consider making dynamic
                        style: TextStyle(
                          color: Colors.white70, // Lighter white text
                          fontSize: 17, // Larger font
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ), // Reduced space before description
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.item.description,
                        style: const TextStyle(
                          color: Colors
                              .white60, // Lighter white text for description
                          fontSize: 16, // Slightly larger
                          height:
                              1.4, // Slightly reduced line height for more lines
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Reduced space after description
                  const Text(
                    'Select Size',
                    style: TextStyle(
                      color: Colors.white, // White for size title
                      fontSize: 20, // Larger font
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15), // More space
                  Wrap(
                    spacing: 15, // Increased spacing
                    runSpacing: 10, // Increased run spacing
                    children: widget.item.sizePrices.keys.map((size) {
                      final bool isSelected = size == selectedSize;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = size;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24, // More padding
                            vertical: 14, // More padding
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors
                                      .orange
                                      .shade600 // Solid orange for selected
                                : Colors
                                      .grey
                                      .shade900, // Dark background for unselected
                            borderRadius: BorderRadius.circular(
                              30,
                            ), // More rounded
                            border: Border.all(
                              color: isSelected
                                  ? Colors.orange.shade600
                                  : Colors
                                        .white12, // Subtle white border for unselected
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors
                                        .white // White text on orange
                                  : Colors
                                        .white70, // Lighter white on dark background
                              fontWeight: FontWeight.w600,
                              fontSize: 17, // Larger font
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 30), // More space
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Selector
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ), // Increased padding
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900, // Darker background
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white12,
                            width: 1.0,
                          ), // Subtle border
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.white70, // Lighter white
                                size: 28, // Larger icon
                              ),
                              onPressed: quantity > 1
                                  ? () => setState(() => quantity--)
                                  : null,
                              visualDensity: VisualDensity.compact,
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                color: Colors.white, // White text
                                fontSize: 22, // Larger font
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.white70, // Lighter white
                                size: 28, // Larger icon
                              ),
                              onPressed: () => setState(() => quantity++),
                              visualDensity: VisualDensity.compact,
                            ),
                          ],
                        ),
                      ),

                      // Total Price
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.orange.shade600, // Consistent orange
                          fontSize: 32, // Larger price
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(), // Pushes the button to the bottom
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart logic
                        final newItem = cartinput(); // Get the Cartitem object
                        // Assuming 'cart' is a global list or accessible via Provider
                        // For this example, we'll directly add to the global 'cart' list
                        // In a real app, you'd use Provider.of<CartManager>(context, listen: false).addItemToCart(...)
                        final existingIndex = cart.indexWhere(
                          (item) =>
                              item.item == newItem.item &&
                              item.size == newItem.size,
                        );

                        if (existingIndex != -1) {
                          cart[existingIndex].quantity += newItem.quantity;
                          cart[existingIndex].price =
                              cart[existingIndex]
                                  .item
                                  .sizePrices[cart[existingIndex].size]! *
                              cart[existingIndex]
                                  .quantity; // Update total price for existing item
                        } else {
                          cart.add(newItem);
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${widget.item.name} (${selectedSize}) x$quantity added to cart!',
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.orange.shade600, // Consistent orange button
                        padding: const EdgeInsets.symmetric(
                          vertical: 22,
                        ), // More padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // More rounded
                        ),
                        elevation: 8, // More prominent shadow
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white, // White text on orange button
                          fontSize: 24, // Larger font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
