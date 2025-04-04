import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Using our theme colors: Yellow (#FFC900), Light Gray (#E1DFD9), Almost Black (#111110)
  final primaryColor = const Color(0xFFFFC900);
  final secondaryColor = const Color(0xFFE1DFD9);
  final textColor = const Color(0xFF111110);

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      image: Image.asset(
        'assets/images/1.png',
        height: 200,
     
      ),
      title: 'Welcome to GBJ Campus',
      description: 'Your one-stop solution for all your business needs',
    ),
    OnboardingContent(
      image: Image.asset(
        'assets/images/2.png',
        height: 200,
        
      ),
      title: 'Streamlined Services',
      description: 'Access a wide range of services designed to help your business grow',
    ),
    OnboardingContent(
      image: Image.asset(
        'assets/images/3.png',
        height: 200,
        
      ),
      title: '24/7 Support',
      description: 'Get help anytime with our dedicated customer support team',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Set status bar to match our color scheme
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, secondaryColor.withOpacity(0.3)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/gbj.png',
                      height: 50,
                   
                    ),
                    _currentPage != _contents.length - 1
                        ? TextButton(
                            onPressed: () {
                              _pageController.jumpToPage(_contents.length - 1);
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _contents.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primaryColor.withOpacity(0.1),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor.withOpacity(0.3),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                ),
                                child: _contents[index].image,
                              ),
                            ),
                          ),
                          Column(
                            children: [
Text(
                            _contents[index].title,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _contents[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor.withOpacity(0.7),
                            ),
                            textAlign: TextAlign.center,
                          ),
                            ],
                          )
                          
                        ],
                      ),
                    );
                  },
                ),
              ),
              _buildPageIndicator(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: _currentPage == _contents.length - 1
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/webview', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: textColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size.fromHeight(55),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: IconButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: textColor,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _contents.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 10,
            width: _currentPage == index ? 25 : 10,
            decoration: BoxDecoration(
              color: _currentPage == index ? primaryColor : secondaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingContent {
  final Image image;
  final String title;
  final String description;
  

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}
