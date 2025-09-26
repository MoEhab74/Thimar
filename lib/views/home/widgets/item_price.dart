import 'package:flutter/material.dart';

class ItemPrice extends StatelessWidget {
  const ItemPrice({
    super.key,
    this.image,
    this.discount,
    required this.title,
    required this.priceBeforeDiscount,
    required this.price,
  });
  final String? image;
  final double? discount;
  final String title;
  final double priceBeforeDiscount;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Color(0x00000005).withValues(alpha: 0.5),
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    image ?? 'https://upload.wikimedia.org/wikipedia/commons/8/89/Tomato_je.jpg',
                    width: 148,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomLeft: Radius.circular(12.0),
                    ),
                  ),
                  child: Text(
                    '${discount ?? 0}%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                // Add to cart button
                Positioned(
                  bottom: -60,
                  left: 8,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff61B80C),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        onPressed: () {
                          // Handle add to cart action
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text.rich(
                  textDirection: TextDirection.rtl,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const TextSpan(text: '\n'),
                      const TextSpan(
                        text: 'السعر / 1 كجم',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF808080),
                        ),
                      ),
                      TextSpan(
                        text: '\n${price.toStringAsFixed(2)} ر.س  ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextSpan(
                        text: '${priceBeforeDiscount.toStringAsFixed(2)} ر.س',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
