import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/views/home/categories/cubit/cubit.dart';
import 'package:thimar/views/home/widgets/category_item.dart';
import 'package:thimar/views/home/widgets/item_price.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(title: const Text('Home View')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Add your widgets here
              Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  'الأقسام',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              // Category items builder
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesError) {
                    return Center(child: Text(state.message));
                  } else if (state is CategoriesLoaded) {
                    return SizedBox(
                      height: 135,
                      child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return CategoryItem(category: state.list[index]);
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  'الأصناف',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) => ItemPrice(),
                itemCount: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

