import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/components/form_five.dart';
import 'package:seguridad_evaluacion/src/components/form_four.dart';
import 'package:seguridad_evaluacion/src/components/form_one.dart';
import 'package:seguridad_evaluacion/src/components/form_three.dart';
import 'package:seguridad_evaluacion/src/components/form_two.dart';
import 'package:seguridad_evaluacion/src/components/forms_buttons.dart';
import 'package:seguridad_evaluacion/src/providers/form_five_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_four_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_one_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_three_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_two_provider.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class EvaluationForm extends StatefulWidget {
  const EvaluationForm({Key? key}) : super(key: key);

  @override
  _EvaluationFormState createState() => _EvaluationFormState();
}

class _EvaluationFormState extends State<EvaluationForm> {
  final PageController _pageController = PageController();
  final ValueNotifier<double> _currentPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormOneProvider>(
          create: (_) => FormOneProvider(),
        ),
        ChangeNotifierProvider<FormTwoProvider>(
          create: (_) => FormTwoProvider(),
        ),
        ChangeNotifierProvider<FormThreeProvider>(
          create: (_) => FormThreeProvider(),
        ),
        ChangeNotifierProvider<FormFourProvider>(
          create: (_) => FormFourProvider(),
        ),
        ChangeNotifierProvider<FormFiveProvider>(
          create: (_) => FormFiveProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Text("Evaluación de seguridad"),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            backgroundColor: const Color(primaryColor),
          ),
          backgroundColor: const Color(primaryColor),
          body: SafeArea(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(normalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPageView(),
                      ValueListenableBuilder(
                          valueListenable: _currentPage,
                          builder: (_, value, child) {
                            return FormButtons(
                              initializeController: initializeController,
                              currentPage: _currentPage.value,
                              updateCurrentValue: updateCurrentPage,
                              pageController: _pageController,
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildPageView() {
    return Expanded(
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          FormOne(),
          FormTwo(),
          FormThree(),
          FormFour(),
          FormFive(),
        ],
      ),
    );
  }

  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  }

  void updateCurrentPage(double currentPage) {
    _currentPage.value = currentPage;
  }
}
