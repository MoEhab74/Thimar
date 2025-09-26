import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/ui/app_bar_actions.dart';
import 'package:thimar/core/ui/app_bar_leading.dart';
import 'package:thimar/core/ui/app_bar_title.dart';
import 'package:thimar/views/home/categories/cubit/cubit.dart';
import 'package:thimar/views/home/slider/cubit.dart';
import 'package:thimar/views/home/slider/state.dart';
import 'package:thimar/views/home/widgets/category_item.dart';
import 'package:thimar/views/home/widgets/item_price.dart';
import 'package:thimar/views/home/widgets/slider_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SliderCubit>(context).getSliders();
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: AppBarTitle(),
        actions: [
          AppBarActions(),
        ],
        leading: AppBarLeading(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ).copyWith(bottom: 16),
              child: TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  hintText: 'ابحث عن ماتريد؟',
                  hintStyle: const TextStyle(fontFamily: 'Tajawal'),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Color(0xffB9C9A8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xff4C8613).withValues(alpha: 0.03),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16,
                  ),
                ),
              ),
            ),
            // Sliders
            BlocBuilder<SliderCubit, SliderState>(
              buildWhen: (previous, current) =>
                  current is! SliderUpdateIndicatorState,
              builder: (context, state) {
                if (state is SliderLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SliderError) {
                  return Center(child: Text(state.message));
                } else if (state is SliderLoaded) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CarouselSlider(
                        items: List.generate(
                          state.list.length,
                          (index) => SliderItem(image: state.list[index].media),
                        ),
                        options: CarouselOptions(
                          reverse: true,
                          height: 200,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          onPageChanged: (index, reason) {
                            BlocProvider.of<SliderCubit>(
                              context,
                            ).updateIndicator(index);
                          },
                        ),
                      ),
                      // slider indicators
                      const SizedBox(height: 8),
                      BlocBuilder(
                        bloc: BlocProvider.of<SliderCubit>(context),
                        buildWhen: (previous, current) =>
                            current is SliderUpdateIndicatorState,
                        builder: (context, indicatorState) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              state.list.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(
                                  right: state.list.length - 1 == index ? 0 : 4,
                                ),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor:
                                      BlocProvider.of<SliderCubit>(
                                            context,
                                          ).selectedSlider ==
                                          index
                                      ? const Color(0xff4C8613)
                                      : const Color(0xffE0E0E0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
                return Center(child: Text(state.runtimeType.toString()));
              },
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  'الأقسام',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
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
                      padding: const EdgeInsets.only(right: 16),
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
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  'الأصناف',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}
