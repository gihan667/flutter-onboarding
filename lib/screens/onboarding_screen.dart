import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: demoSlide.length,
                itemBuilder: (context, index) {
                  return SliderItem(
                    image: demoSlide[index].image,
                    title: demoSlide[index].title,
                    subTitle: demoSlide[index].subTitle,
                  );
                }
              ),
            ),

            Container(
              height: 55,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                // color: Colors.transparent,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF53E88B),
                    Color(0xFF15BE77),
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap: () {
                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  },
                  child: Container(
                    height: 55,
                    width: 200,
                    alignment: Alignment.center,
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardSlide {
  final String image;
  final String title;
  final String subTitle;

  OnboardSlide({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

final demoSlide = [
  OnboardSlide(
    image: 'assets/images/slide1.png',
    title: 'Find your comfort\nfood here',
    subTitle: 'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
  ),
  OnboardSlide(
    image: 'assets/images/slide2.png',
    title: 'Find your comfort\nfood here',
    subTitle: 'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
  ),
  OnboardSlide(
    image: 'assets/images/slide2.png',
    title: 'Find your comfort\nfood here',
    subTitle: 'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
  ),
];

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),

        Image.asset(
          image,
          height: 300.0,
        ),

        const Spacer(),
      
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      
        const SizedBox(
          height: 20.0,
        ),
      
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12.0,
          ),
        ),

        const Spacer(),

      ],
    );
  }
}