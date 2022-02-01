import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/components/form_five.dart';
import 'package:seguridad_evaluacion/src/providers/form_five_provider.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';

class QualifyBuilding extends StatefulWidget {
  const QualifyBuilding(
      {Key? key, required this.buildingId, required this.userId})
      : super(key: key);

  final String buildingId;
  final String userId;
  @override
  _QualifyBuildingState createState() => _QualifyBuildingState();
}

class _QualifyBuildingState extends State<QualifyBuilding> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormFiveProvider>(
          create: (_) => FormFiveProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Evaluación de seguridad"),
            backgroundColor: Color(primaryColor),
          ),
          body: Container(
            child: FormFive(
              buildingId: widget.buildingId,
              userId: widget.userId,
            ),
          ),
        ),
      ),
    );
  }
}
