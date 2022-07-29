import 'package:flutter/material.dart';
import 'package:work_shop_app/models/visual_inspection_mechanical_and_rotor_stator_clearances_model.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';

class VisualInspectionMechanical extends StatefulWidget {
  final String docName;
  @override
  _VisualInspectionMechanical createState() => _VisualInspectionMechanical();
  const VisualInspectionMechanical({Key? key, required this.docName})
      : super(key: key);
}

class _VisualInspectionMechanical extends State<VisualInspectionMechanical> {
  final bar = SnackBar(content: Text( Localozation.localization 
                      ? "Data succesfully added"
                      : "Данные добавленны"));
  late final VisualMechanicalInsectionModel _modelInstance =
      VisualMechanicalInsectionModel(docName: widget.docName);
  final _formKeyForms = GlobalKey<FormState>();
  Future<bool?> _showWarning(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                  Localozation.localization ? "Data on that page won't be saved. Are you sure?" : "Данные на этой странице будут потерянны. Вы уверены?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(Localozation.localization ? "Yes, leave page" : "Да, покинуть страницу",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(Localozation.localization ? "No, stay on page" : "Нет, остаться на странице",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)))
              ],
            ));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final _closePage = await _showWarning(context);
        return _closePage ?? false;
      },
      child: Scaffold(
      appBar: (AppBar(
        backgroundColor: const Color.fromARGB(255, 53, 0, 211),
        title: const Text('Edil-Oral.kz'),
      )),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Builder(
              builder: (context) => Form(
                  key: _formKeyForms,
                  child: ListView(cacheExtent: 20000000, children: [
                    
                        Center(child: Text(
                            Localozation.localization
                                ? "Visual inspection mechanical and rotor-stator diametral clearences"
                                : "Визуальная испекия и измерение зазоров ротор-статор",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.driveABearingSeat,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Condition of drive end bearing seat"
                      : "Состояние посадочного места подшипника со стороны приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.driveABearingSeat = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.driveABearingSeatNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.noneDriveABearingSeat,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of none drive end bearing seat"
                      : "Состояние посадочного места подшипника со стороны не приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.noneDriveABearingSeat = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.noneDriveABearingSeatNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.driveEJointFrame,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:
                          Localozation.localization 
                      ? "Condition of drive end joint of motor frame"
                      : "Состояние соединения корпуса двигателя со стороны приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.driveEJointFrame = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.driveEJointFrameNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.jointOnDrive,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization ? 
                      "Condition of joint on drive end-shield"
                      : "Состояние соединения корпуса двигателя со стороны приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.jointOnDrive = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.jointOnDriveNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.noneDriveEndJ,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of none drive end joint of motor frame"
                      : "Состояние соединения торцевого щита со стороны приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.noneDriveEndJ = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.noneDriveEndJNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.jointOnNoneDrive,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of joint on none drive end-shield"
                      : "Состояние соединения торцевого щита со стороны неприводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.jointOnNoneDrive = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.jointOnNoneDriveNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.driveEndShieldJoint,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of drive end-shield joint to bearing cap"
                      : "Состояние соединения торцевого щита с крышкой подшипника с приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.driveEndShieldJoint = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.driveEndShieldJointNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.driveEndBearing,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of drive end bearing cap joint"
                      : "Состояние стыкового соединения крышки подшипника с приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.driveEndBearing = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.driveEndBearingNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.noneDriveEndShield,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of none drive end-shield joint to bearing cap"
                      : "Состояние соединения торцевого щита с крышкой подшипника с не приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.noneDriveEndShield = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.noneDriveEndShieldNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.noneDriveEndBearing,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of none drive end bearing cap joint"
                      : "Состояние стыкового соединения крышки подшипника с не приводного конца вала",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.noneDriveEndBearing = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.noneDriveEndBearingNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.condtitionOfBolts,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of bolts"
                      : "Состояния болтовых соединений",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.condtitionOfBolts = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.condtitionOfBoltsNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.condtitionOfOilseals,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of oilseals"
                      : "Состояния сальниковых уплотнений ",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.condtitionOfOilseals = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.condtitionOfOilsealsNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.condtitionOfFun,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Conditionof the fan"
                      : "Состояние вентилятора",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.condtitionOfFun = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.condtitionOfFunNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.condtitionOfFunCover,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of the fan cover"
                      : "Состояние крышки вентилятора ",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.condtitionOfFunCover = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.condtitionOfFunCoverNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.precenseOfKey,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "The presence of a key"
                      : "Наличие шпонки",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.precenseOfKey = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.precenseOfKeyNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.presenceOfCoupl,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "The presence of a coupling"
                      : "Наличие муфты",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.presenceOfCoupl = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.presenceOfCouplNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.minimumDistBW,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Minimum distance between windings"
                      : "Минимальное расстояния между обмотками",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.minimumDistBW = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.minimumDistBWNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.maximumDOfR,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Maximum diameter of rotor body"
                      : "Максимальный диаметр ротора",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.maximumDOfR = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.maximumDOfRNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.diametrClearBRAS,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Diametral clearances between rotor and stator"
                      : "Диаметральный зазор между ротором и статором",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.diametrClearBRAS = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.diametrClearBRASNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.rotorBalancR,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Rotor balancing required"
                      : "Ротор нужнается в балансировке",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.rotorBalancR = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.rotorBalancRNote = value!),
                    ),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: ElevatedButton(
                        child: Text(Localozation.localization 
                        ? "Save"
                        : "Сохнранить"),
                        onPressed: () {
                          if (_formKeyForms.currentState!.validate()) {
                            _formKeyForms.currentState!.save();
                            _modelInstance.sendData();
                            bar.show(context);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ])))),
    ));
  }
}
