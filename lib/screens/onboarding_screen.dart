import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocer_ease/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/app_description_data.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: MediaQuery.sizeOf(context).height * 0.6,
              width: double.infinity,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Image.asset(
                grocer1,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.white,
                    activeDotColor: Theme.of(context).colorScheme.secondary,
                    spacing: 8.0,
                    radius: 20.0,
                    dotWidth: 6.0,
                    dotHeight: 6.0,
                  ),
                  onDotClicked: (index) {}),
            ),
            SizedBox(
              width: 300,
              height: 150,
              child: PageView.builder(
                  controller: controller,
                  itemCount: groceryAppDescriptions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(groceryAppDescriptions[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          groceryAppDescriptions[index].description,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => context.go('/homePage'),
                    child: Text(
                      "Continue",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
