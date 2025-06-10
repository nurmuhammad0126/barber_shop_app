import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/on_baording/on_baording_bloc.dart';
import '../widgets/on_barding_body.dart';

class OnBoardingSceen extends StatefulWidget {
  const OnBoardingSceen({super.key});

  @override
  State<OnBoardingSceen> createState() => _OnBoardingSceenState();
}

class _OnBoardingSceenState extends State<OnBoardingSceen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc(totalPages: 9),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: OnBoardingBody(),
      ),
    );
  }
}
