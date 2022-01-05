import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/form_one.dart';
import 'package:seguridad_evaluacion/src/components/form_three.dart';
import 'package:seguridad_evaluacion/src/components/form_two.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class EvaluationForm extends StatefulWidget {
  const EvaluationForm({Key? key}) : super(key: key);

  @override
  _EvaluationFormState createState() => _EvaluationFormState();
}

class _EvaluationFormState extends State<EvaluationForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evaluación de seguridad"),
        backgroundColor: Color(primaryColor),
      ),
      backgroundColor: Color(primaryColor),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(normalPadding),
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
                                onTap: () {
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.easeInOut);
                                  setState(() {
                                    _currentPage = _currentPage - 1;
                                  });
                                });
                          },
                        ),
                      const Spacer(),
                      PrimaryButton(
                          buttonText: "Siguiente",
                          onTap: () {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 1000),
                                curve: Curves.easeInOut);
                            setState(() {
                              _currentPage = _currentPage + 1;
                            });
                          }),
                    ],
                  ),
                ],
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
        children: [
          FormOne(),
          FormTwo(),
          FormThree(),
        ],
      ),
    );
  }

  Future<bool> initializeController() {
    Completer<bool> completer = new Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  }
}
