import 'package:flutter/material.dart';
import 'package:movies_app/app_colors/app_images.dart';
import 'package:movies_app/app_colors/colors.dart';
import 'package:movies_app/home_screen.dart';
import 'package:movies_app/login_screen.dart';

class OnBoarding extends StatefulWidget {
  static const String routeName = "OnBoarding";

  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var pageController = PageController();

  List<String> onBoardingImages = [
    AppImages.onBoarding1,
    AppImages.onBoarding2,
    AppImages.onBoarding3,
    AppImages.onBoarding4,
    AppImages.onBoarding5,
    AppImages.onBoarding6,
  ];

  List<String> onBoardingTitles = [
    "Find Your Next Favorite Movie Here",
    "Discover Movies",
    "Explore All Genres",
    "Create Watchlists",
    "Rate, Review, and Learn",
    "Start Watching Now"
  ];

  List<String> onBoardingDescriptions = [
    "Get access to a huge library of movies to suit all tastes. You will surely like it.",
    "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    ""
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: onBoardingImages.length,
            onPageChanged: (value) {
              currentIndex = value;
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Image.asset(
                onBoardingImages[currentIndex],
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.fill,
              );
            },
          ),
          DraggableScrollableSheet(
            initialChildSize:
                currentIndex == 0 || currentIndex == 5 ? 0.32 : 0.42,
            minChildSize: .25,
            maxChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: currentIndex == 0
                      ? AppColors.black.withOpacity(0.4)
                      : AppColors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              onBoardingTitles[currentIndex],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              onBoardingDescriptions[currentIndex],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            currentIndex == 1 || currentIndex == 2 ? 53 : 24,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 126,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  currentIndex == 5
                                      ? Navigator.pushNamed(
                                          context, LoginScreen.routeName)
                                      : pageController.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.yellow,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)))),
                                child: Text(
                                  currentIndex == 5
                                      ? "Finish"
                                      : currentIndex == 0
                                          ? "Explore Now"
                                          : "Next",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Visibility(
                                visible: currentIndex > 0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    pageController.previousPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: AppColors.yellow,
                                              width: 2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)))),
                                  child: Text(
                                    "Back",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
