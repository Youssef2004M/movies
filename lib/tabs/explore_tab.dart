import 'package:flutter/material.dart';
import 'package:movies_app/app_colors/app_images.dart';
import 'package:movies_app/app_colors/colors.dart';

class ExploreTab extends StatefulWidget {
  ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  int selectedCategory = 0;

  List<String> categories = ["Action", "Adventure", "Animation"];

  List<String> movies = [
    AppImages.onBoarding4,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
    AppImages.onBoarding5,
    AppImages.batman,
    AppImages.capAmerica,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      selectedCategory = index;
                      setState(() {});
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedCategory == index
                              ? AppColors.yellow
                              : Colors.transparent,
                          border:
                              Border.all(color: AppColors.yellow, width: 2)),
                      child: Text(categories[index],
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: selectedCategory == index
                                      ? AppColors.black
                                      : AppColors.yellow,
                                  fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.8),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset(
                          movies[index],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              margin: EdgeInsets.only(left: 9, top: 11),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.grey.withOpacity(0.71)),
                              child: Row(
                                children: [
                                  Text(
                                    "7.7",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  ImageIcon(
                                    AssetImage(AppImages.star),
                                    color: AppColors.yellow,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
