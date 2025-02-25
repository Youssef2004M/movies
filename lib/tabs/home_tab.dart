import 'package:flutter/material.dart';
import 'package:movies_app/app_colors/app_images.dart';
import 'package:movies_app/app_colors/colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> movies = [
    AppImages.onBoarding2,
    AppImages.onBoarding3,
    AppImages.onBoarding4,
    AppImages.onBoarding5,
    AppImages.onBoarding6,
  ];

  final List<String> movies2 = [
    AppImages.capAmerica,
    AppImages.batman,
    AppImages.onBoarding4,
    AppImages.onBoarding3,
  ];

  final PageController pageController = PageController();

  final int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppImages.availableNow),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
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
                                        color:
                                            AppColors.grey.withOpacity(0.71)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "7.7",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
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
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 16),
                    itemCount: movies.length),
              ),
              Image.asset(AppImages.watchNow),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Action",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "See More",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.yellow,
                            size: 15,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              Image.asset(
                                movies2[index],
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
                                        color:
                                            AppColors.grey.withOpacity(0.71)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "7.7",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
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
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: movies2.length),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
