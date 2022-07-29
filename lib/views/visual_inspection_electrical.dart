import 'package:flutter/material.dart';
import 'package:work_shop_app/models/visual_inspection_electrical_mode.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';

class VisualInspectionElctrical extends StatefulWidget {
  final String docName;
  @override
  _VisualInspectionElctrical createState() => _VisualInspectionElctrical();
  const VisualInspectionElctrical({Key? key, required this.docName})
      : super(key: key);
}

class _VisualInspectionElctrical extends State<VisualInspectionElctrical> {
  final bar = SnackBar(content: Text(Localozation.localization 
                      ? "Data succesfully added"
                      : "Данные успешно добавленны"));
  late final VisualInspectionElectrical _modelInstance =
      VisualInspectionElectrical(docName: widget.docName);
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
                                ? "Visual inspection electrical part"
                                : "Визуальная испекция электрическая часть",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.conditionOfStator,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of stator (visual check)"
                      : "Состояние статора визульный осмотр",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.conditionOfStator = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.conditionOfStatorNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.conditionOfFrameTerminalBox,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of frame-terminal box flange surfaces"
                      : "Состояние флянцевой поверхности терминальной коробки",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.conditionOfFrameTerminalBox = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.conditionOfFrameTerminalBoxNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.conditionOfStatorIP,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:
                          Localozation.localization 
                      ? "Condition of stator intermediate plate-terminal box flange surface"
                      : "Состояние флянцевой поверхности промежуточная пластина-терминальная коробка",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.conditionOfStatorIP = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.conditionOfStatorIPNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.conditionOfTerminalBoxTB,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of terminal box- terminal box lid flange surfaces"
                      : "Состояние флянцевой поверхности промежуточная пластина-корпус",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.conditionOfTerminalBoxTB = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.conditionOfTerminalBoxTBNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.conditionOfTerminalBoxGP,
                      iterList: _modelInstance.commonItems,
                      textOfWidget: Localozation.localization 
                      ? "Condition of terminal box- gland plate flange surfaces"
                      : "Состояния фланцевых поверхностей терминальная коробка-пластины кабельного ввода",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.conditionOfTerminalBoxGP = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.conditionOfTerminalBoxGPNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.minimumGapTB,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Minimum Gap terminal box (mm)"
                      : "Минимальный зазаор согласно стандарту",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.minimumGapTB = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.minimumGapTBNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.terminalInsulators,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Condition of terminal insulators"
                      : "Состояние терминальных изоляторов",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.terminalInsulators = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.terminalInsulatorsNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.glandPlatePresent,
                      iterList: _modelInstance.commonItemsYN,
                      textOfWidget:  Localozation.localization 
                      ? "Gland plate Present Yes/No"
                      : "Наличие кабельного ввода Yes/No",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.glandPlatePresent = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.glandPlatePresentNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.rotorConcentricity,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Rotor concentricity"
                      : "Эксцентричность ротора",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.rotorConcentricity = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.rotorConcentricityNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.transformers,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Transformers"
                      : "Трансфоматоры",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.transformers = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.transformersNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.brashes,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Brash"
                      : "Щетки",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.brashes = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.brashesNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.commutator,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Commutator"
                      : "Коллектор",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.commutator = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.commutatorNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.motorFreeInternalVolume,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Motor free internal volume"
                      : "Внутренний объем мотора",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.motorFreeInternalVolume = newValue!;
                        });
                      },
                      onSaved: (value) => setState(
                          () => _modelInstance.motorFreeInternalVolumeNote = value!),
                    ),
                    
                    CommonColumnForTables(
                      initialDrop: _modelInstance.terminalBoxFreeInternalVolume,
                      iterList: _modelInstance.commonItems,
                      textOfWidget:  Localozation.localization 
                      ? "Terminal box free internal volume"
                      : "Внутренни объем терминальной коробки",
                      onChanged: (String? newValue) {
                        setState(() {
                          _modelInstance.terminalBoxFreeInternalVolume = newValue!;
                        });
                      },
                      onSaved: (value) => setState(() =>
                          _modelInstance.terminalBoxFreeInternalVolumeNote = value!),
                    ),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: ElevatedButton(
                        child: Text( Localozation.localization 
                      ? "Save"
                      : "Сохранить"),
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
