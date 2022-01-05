import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

enum StructureType {
  metalCovers,
  corrugatedFiberCementRoofing,
  asphaltTileRoofs,
  selfSupportingRoofs,
  polycarbonateCovers,
}

enum ColumnStructures {
  concrete,
  steel,
  wood,
}

enum WallStructure {
  concrete,
  wood,
  brick,
  stone,
}

enum Pre { yes, no }

class FormTwo extends StatefulWidget {
  const FormTwo({Key? key}) : super(key: key);

  @override
  State<FormTwo> createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  StructureType? _radioValueRoof = StructureType.metalCovers;
  ColumnStructures? _radioValueColumn = ColumnStructures.concrete;
  WallStructure? _radioValueWall = WallStructure.concrete;
  Pre? _radioValuePre = Pre.yes;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Spacer(),
                  Text(
                    "Estructura de la vivienda",
                    style: TextStyle(
                      fontSize: extraBigFont,
                      color: Color(primaryColor),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              ...buildRoofStructure(),
              const SizedBox(
                height: 8,
              ),
              ...buildColumnStructure(),
              ...buildWallStructureForm(),
              ...buildPreConnection(),
            ],
          ),
        ),
      ),
    );
  }

  buildRoofStructure() {
    return [
      const Text(
        " 2. Indique el material del techo",
        style: TextStyle(
          fontSize: extraBigFont,
          color: Color(primaryColor),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: Text("Cubiertas metálicas"),
        leading: Radio<StructureType>(
          groupValue: _radioValueRoof,
          value: StructureType.metalCovers,
          onChanged: (StructureType? value) {
            setState(() {
              _radioValueRoof = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Cubiertas onduladas de fibrocemento"),
        leading: Radio<StructureType>(
          groupValue: _radioValueRoof,
          value: StructureType.corrugatedFiberCementRoofing,
          onChanged: (StructureType? value) {
            setState(() {
              _radioValueRoof = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Cubiertas de tejas asfálticas"),
        leading: Radio<StructureType>(
          groupValue: _radioValueRoof,
          value: StructureType.asphaltTileRoofs,
          onChanged: (StructureType? value) {
            setState(() {
              _radioValueRoof = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Cubiertas autoportantes"),
        leading: Radio<StructureType>(
          groupValue: _radioValueRoof,
          value: StructureType.selfSupportingRoofs,
          onChanged: (StructureType? value) {
            setState(() {
              _radioValueRoof = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Cubiertas de policarbonato"),
        leading: Radio<StructureType>(
          groupValue: _radioValueRoof,
          value: StructureType.polycarbonateCovers,
          onChanged: (StructureType? value) {
            setState(() {
              _radioValueRoof = value;
            });
          },
        ),
      ),
    ];
  }

  buildColumnStructure() {
    return [
      const Text(
        " 3. Indique el material usado para las columnas",
        style: TextStyle(
          fontSize: extraBigFont,
          color: Color(primaryColor),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: Text("Concreto"),
        leading: Radio<ColumnStructures>(
          groupValue: _radioValueColumn,
          value: ColumnStructures.concrete,
          onChanged: (ColumnStructures? value) {
            setState(() {
              _radioValueColumn = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Acero"),
        leading: Radio<ColumnStructures>(
          groupValue: _radioValueColumn,
          value: ColumnStructures.steel,
          onChanged: (ColumnStructures? value) {
            setState(() {
              _radioValueColumn = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Madera"),
        leading: Radio<ColumnStructures>(
          groupValue: _radioValueColumn,
          value: ColumnStructures.wood,
          onChanged: (ColumnStructures? value) {
            setState(() {
              _radioValueColumn = value;
            });
          },
        ),
      ),
    ];
  }

  buildWallStructureForm() {
    return [
      const Text(
        " 4. De que material estan construidas las paredes",
        style: TextStyle(
          fontSize: extraBigFont,
          color: Color(primaryColor),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: Text("Concreto"),
        leading: Radio<WallStructure>(
          groupValue: _radioValueWall,
          value: WallStructure.concrete,
          onChanged: (WallStructure? value) {
            setState(() {
              _radioValueWall = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Madera"),
        leading: Radio<WallStructure>(
          groupValue: _radioValueWall,
          value: WallStructure.wood,
          onChanged: (WallStructure? value) {
            setState(() {
              _radioValueWall = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Ladrillo"),
        leading: Radio<WallStructure>(
          groupValue: _radioValueWall,
          value: WallStructure.brick,
          onChanged: (WallStructure? value) {
            setState(() {
              _radioValueWall = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("Piedra"),
        leading: Radio<WallStructure>(
          groupValue: _radioValueWall,
          value: WallStructure.stone,
          onChanged: (WallStructure? value) {
            setState(() {
              _radioValueWall = value;
            });
          },
        ),
      ),
    ];
  }

  buildPreConnection() {
    return [
      const Text(
        " 5. Existen conexiones prefabricadas?",
        style: TextStyle(
          fontSize: extraBigFont,
          color: Color(primaryColor),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: Text("Sí"),
        leading: Radio<Pre>(
          groupValue: _radioValuePre,
          value: Pre.yes,
          onChanged: (Pre? value) {
            setState(() {
              _radioValuePre = value;
            });
          },
        ),
      ),
      ListTile(
        title: Text("No"),
        leading: Radio<Pre>(
          groupValue: _radioValuePre,
          value: Pre.no,
          onChanged: (Pre? value) {
            setState(() {
              _radioValuePre = value;
            });
          },
        ),
      ),
    ];
  }
}
