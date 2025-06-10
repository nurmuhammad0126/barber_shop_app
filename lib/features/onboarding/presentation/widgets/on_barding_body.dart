import 'package:barbar_app/core/constants/app_images.dart';
import 'package:barbar_app/core/extensions/context_extension.dart';
import 'package:barbar_app/core/extensions/size_extensions.dart';
import 'package:barbar_app/features/auth/presentation/pages/choose_login_screen.dart';
import 'package:barbar_app/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/widgets/w_button.dart';
import '../blocs/on_baording/on_baording_bloc.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final PageController pageController = PageController();

  final List<String> titles1 = [
    "Yoqtirgan taomingizni tanlash imkoniyati",
    "Yoqtirgan taomingizni tanlash imkoniyati",
    "Yoqtirgan taomingizni tanlash imkoniyati",
    "Qisqa vaqt ichida sifatli yetkazib berish",
    "Tezkor va ishonchli kuryerlar xizmati",
    "Yoqtirgan taomingizni tanlash imkoniyati",
    "Yoqtirgan taomingizni tanlash imkoniyati",
    "Qisqa vaqt ichida sifatli yetkazib berish",
    "Tezkor va ishonchli kuryerlar xizmati",
  ];

  final List<String> titles2 = [
    "Yoqtirgan taomingizni yashash joyingizga yaqin joydan toping va lazzatlaning!",
    "Yoqtirgan taomingizni qaynoq va sifati buzilmagan holda yetkazamiz!",
    "Tajribali va tezkor yetkazish ko'nikmasiga ega kuryerlar yetkazadi!",
    "Yoqtirgan taomingizni yashash joyingizga yaqin joydan toping va lazzatlaning!",
    "Yoqtirgan taomingizni qaynoq va sifati buzilmagan holda yetkazamiz!",
    "Yoqtirgan taomingizni qaynoq va sifati buzilmagan holda yetkazamiz!",
    "Tajribali va tezkor yetkazish ko'nikmasiga ega kuryerlar yetkazadi!",
    "Yoqtirgan taomingizni yashash joyingizga yaqin joydan toping va lazzatlaning!",
    "Yoqtirgan taomingizni qaynoq va sifati buzilmagan holda yetkazamiz!",
  ];

  void nextPage(BuildContext context) {
    final bloc = context.read<OnBoardingBloc>();
    final currentPage = bloc.state.currentPage;

    if (currentPage < titles1.length - 1) {
      bloc.add(OnBoardingNextPressed());
      pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChooseLoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final safeAreaHeight =
        MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    final availableHeight = screenHeight - safeAreaHeight;

    final bottomContainerHeight = availableHeight * 0.4;

    return Column(
      children: [
        // Top content - rasm qismi
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
              buildWhen:
                  (previous, current) =>
                      previous.currentPage != current.currentPage,
              builder: (context, state) {
                return PageView.builder(
                  controller: pageController,
                  itemCount: titles1.length,
                  onPageChanged: (index) {
                    context.read<OnBoardingBloc>().add(
                      OnBoardingPageChanged(index),
                    );
                  },
                  itemBuilder:
                      (context, index) => Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.o),
                          child: Image.asset(
                            AppImages.onboarding,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                );
              },
            ),
          ),
        ),
    
        Container(
          height: bottomContainerHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.o),
              topRight: Radius.circular(30.o),
            ),
            color: context.colors.grey222,
          ),
          child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.fromLTRB(24.w, 30.h, 24.w, 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Matn qismi
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            titles1[state.currentPage],
                            style: context.styles.s20w600,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            titles2[state.currentPage],
                            style: context.styles.s14w600,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
    
                    Column(
                      children: [
                        SmoothPageIndicator(
                          controller: pageController,
                          count: titles1.length,
                          effect: WormEffect(
                            dotWidth: 8.w,
                            dotHeight: 8.h,
                            spacing: 6.w,
                            dotColor: context.colors.primaryColor1
                                .withOpacity(0.3),
                            activeDotColor: context.colors.primaryColor1,
                          ),
                        ),
                        SizedBox(height: 24.h),
    
                        // Asosiy tugma
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: WButton(
                            onTap: () {
                              nextPage(context);
                            },
                            text: "Keyingisi",
                          ),
                        ),
    
                        SizedBox(height: 8.h),
    
                        // Skip tugmasi
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text("Skip", style: context.styles.s14w500),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
