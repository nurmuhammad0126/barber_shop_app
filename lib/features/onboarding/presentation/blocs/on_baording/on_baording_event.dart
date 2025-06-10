part of 'on_baording_bloc.dart';

sealed class OnBoardingEvent {}

class OnBoardingNextPressed extends OnBoardingEvent {}

class OnBoardingPageChanged extends OnBoardingEvent {
  final int pageIndex;
  OnBoardingPageChanged(this.pageIndex);
}