import 'package:flutter/material.dart';
import 'package:thimar/views/home/categories/cubit/cubit.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });
  final CategoryDate category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(18.0),
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.05),
          ),
          margin: const EdgeInsets.only(left: 18.0),
          child: Center(
            child: Image.network(
              category.media,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Align(
          alignment: Alignment.center,
          child: Text(
            category.name!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
