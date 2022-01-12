import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/components/form_five.dart';
import 'package:seguridad_evaluacion/src/components/form_four.dart';
import 'package:seguridad_evaluacion/src/components/form_one.dart';
import 'package:seguridad_evaluacion/src/components/form_three.dart';
import 'package:seguridad_evaluacion/src/components/form_two.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
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
  double _currentPage = 0;

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
                      Row(
                        children: [
                          if (_currentPage != 0)
                            FutureBuilder(
                              future: initializeController(),
                              builder: (_, AsyncSnapshot snap) {
                                if (!snap.hasData || _currentPage == 0) {
                                  /// Just return a placeholder widget, here it's nothing but you have to return something to avoid errors
                                  return const SizedBox();
                                }

                                return PrimaryButton(
                                    buttonText: "Anterior",
                                    onTap: () async {
                                      await _pageController.previousPage(
                                          duration: const Duration(
                                              milliseconds: 1000),
                                          curve: Curves.easeInOut);
                                      setState(() {
                                        _currentPage = _pageController.page!;
                                      });
                                    });
                              },
                            ),
                          const Spacer(),
                          PrimaryButton(
                              buttonText:
                                  _currentPage >= 4 ? "Enviar" : "Siguiente",
                              onTap: () async {
                                await _pageController.nextPage(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.easeInOut);
                                if (_currentPage != 4) {
                                  setState(() {
                                    _currentPage = _pageController.page!;
                                  });
                                }
                              }),
                        ],
                      ),
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
}
