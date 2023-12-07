import 'package:flutter/material.dart';
import 'package:flutter_cbt_syarif_app/core/assets/assets.gen.dart';
import 'package:flutter_cbt_syarif_app/core/components/buttons.dart';
import 'package:flutter_cbt_syarif_app/core/extensions/build_context_ext.dart';
import 'package:flutter_cbt_syarif_app/data/datasources/onboarding_local_datasource.dart';
import 'package:flutter_cbt_syarif_app/presentation/auth/pages/login_page.dart';
import 'package:flutter_cbt_syarif_app/presentation/onboarding/models/onboarding_model.dart';
import 'package:flutter_cbt_syarif_app/presentation/onboarding/widgets/onboarding_content.dart';
import 'package:flutter_cbt_syarif_app/presentation/onboarding/widgets/onboarding_indicator.dart';
import 'package:flutter_cbt_syarif_app/presentation/onboarding/widgets/skip_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
        image: Assets.images.onboarding.screen1.path,
        text: "Jelajahi Potensimu dengan Tes Online Akademik di CWB !"),
    OnboardingModel(
        image: Assets.images.onboarding.screen2.path,
        text: "Jelajahi Potensimu dengan Tes Online Akademik di CWB !"),
    OnboardingModel(
        image: Assets.images.onboarding.screen3.path,
        text: "Jelajahi Potensimu dengan Tes Online Akademik di CWB !"),
  ];

  void navigate() {
    context.pushReplacement(const LoginPage());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 400.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.onboarding.ornament.path),
                    fit: BoxFit.contain)),
          ),
          Column(
            children: [
              SkipButton(onPressed: navigate),
              const SizedBox(height: 40),
              OnboardingContent(
                  pageController: pageController,
                  onPageChanged: (index) {
                    currentPage = index;
                    setState(() {});
                  },
                  contents: onboardingData),
              OnboardingIndicator(
                length: onboardingData.length,
                currentPage: currentPage,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button.filled(
                    onPressed: () {
                      if (currentPage < onboardingData.length - 1) {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                        currentPage++;
                        setState(() {});
                      } else {
                        OnboardingLocalDatasource().saveOnboadingPassed();
                        navigate();
                      }
                    },
                    label: "Continue"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
