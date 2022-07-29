import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:work_shop_app/models/ex_de_mechanical_clearance_of_end_shield_model.dart';
import 'package:snack/snack.dart';

class ExDeMechanicalClearance extends StatefulWidget {
  final String docName;
  @override
  _ExDeMechanicalClearance createState() => _ExDeMechanicalClearance();
  const ExDeMechanicalClearance({Key? key, required this.docName})
      : super(key: key);
}

class _ExDeMechanicalClearance extends State<ExDeMechanicalClearance> {
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Data succesfully added"
          : "Данные успешно добавленны"));
  late final ExDeMechanicalCLearanceModel _modelInstance =
      ExDeMechanicalCLearanceModel(docName: widget.docName);
  final _formKeyForms = GlobalKey<FormState>();
  Future<bool?> _showWarning(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(Localozation.localization
                  ? "Data on that page won't be saved. Are you sure?"
                  : "Данные на этой странице будут потерянны. Вы уверены?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(
                        Localozation.localization
                            ? "Yes, leave page"
                            : "Да, покинуть страницу",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                        Localozation.localization
                            ? "No, stay on page"
                            : "Нет, остаться на странице",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                                ? "Clearance of end-shield bearing cover seat"
                                : "Измерение зазора посадочного места крышки подшипника в торцевом щите (Ex d only)",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Type of flame path: "
                                        : "Тип пламягасительного канала",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path DE"
                                          : "Введите тип пламягасительного канала DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .bearingtypeOfFlamePathDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter type of flame path NDE"
                                          : "Введите тип пламягасительного канала NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .bearingtypeOfFlamePathNDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .bearingtypeOfFlamePathNote =
                                              value!))),
                            ]))
                          ],
                        ),
                        
                        Row(children: [
                          SizedBox(
                              width: width / 7,
                              child: Text(
                                  Localozation.localization
                                      ? "Length of flame path: "
                                      : "Длина пламягаситльного канала",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Row(children: [
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: "DE",
                                    emptyValue: Localozation.localization
                                        ? "Enter length of flame path DE"
                                        : "Введите длину пламягасительного канала DE",
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance
                                                .bearinglengthOfFlamePathDe =
                                            value!))),
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: "NDE",
                                    emptyValue: Localozation.localization
                                        ? "Enter length of flame path NDE"
                                        : "Введите длину пламягасительного канала NDE",
                                    textInputAction: TextInputAction.next,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance
                                                .bearinglengthOfFlamePathNDe =
                                            value!))),
                            Flexible(
                                child: CommonForm(
                                    keyBoardType: TextInputType.text,
                                    labelText: Localozation.localization
                                        ? "Note"
                                        : "Заметка",
                                    emptyValue: Localozation.localization
                                        ? "Enter note"
                                        : "Введите заметку",
                                    textInputAction: TextInputAction.done,
                                    validation: false,
                                    onSaved: (value) => setState(() =>
                                        _modelInstance
                                                .bearinglengthOfFlamePathNote =
                                            value!)))
                          ])),
                        ]),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Max. Diameter of flame path in end-shield inner-bearing cover: "
                                        : "Макс. Диаметр пламягасительн -ого канала крышки подшипника торцевого щита",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter max. Diameter of flame path in end-shield inner-bearing cover DE"
                                          : "Введите макс. Диаметр пламягасительного канала крышки подшипника торцевого щита DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .maxDiametrOfFlamePathDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter max. Diameter of flame path in end-shield inner-bearing cover NDE"
                                          : "Введите макс. Диаметр пламягасительного канала крышки подшипника торцевого щита NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .maxDiametrOfFlamePathNDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .maxDiametrOfFlamePathNote =
                                              value!)))
                            ])),
                          ],
                        ),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Min. Diameter of bearing cover: "
                                        : "Минимальный диаметр крышки подшибника: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter min. Diameter of bearing cover DE"
                                          : "Введите минимальный диаметр крышки подшибника DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.minDiametrOfBearingDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter min. Diameter of bearing cover NDE"
                                          : "Введите минимальный диаметр крышки подшибника NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .minDiametrOfBearingNDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance
                                                  .minDiametrOfBearingNote =
                                              value!)))
                            ])),
                          ],
                        ),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Measured clearance: "
                                        : "Измеренный зазор: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter measured clearance DE"
                                          : "Введите измеренный зазор DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.measuredClearanceDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter measured clearance NDE"
                                          : "Введите измеренный зазор NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.measuredClearanceNde =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.measuredClearanceNote =
                                              value!)))
                            ])),
                          ],
                        ),
                        
                        Row(
                          children: [
                            SizedBox(
                                width: width / 7,
                                child: Text(
                                    Localozation.localization
                                        ? "Maximum gap as per standard: "
                                        : "Максимальный зазор согласно стандарта: ",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Row(children: [
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "DE",
                                      emptyValue: Localozation.localization
                                          ? "Enter maximum gap as per standard DE"
                                          : "Введите максимальный зазор согласно стандарту DE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.bearingmaximumGapDe =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: "NDE",
                                      emptyValue: Localozation.localization
                                          ? "Enter maximum gap as per standard NDE"
                                          : "Введите максимальный зазор согласно стандарту NDE",
                                      textInputAction: TextInputAction.next,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.bearingmaximumGapNde =
                                              value!))),
                              Flexible(
                                  child: CommonForm(
                                      keyBoardType: TextInputType.text,
                                      labelText: Localozation.localization
                                          ? "Note"
                                          : "Заметка",
                                      emptyValue: Localozation.localization
                                          ? "Enter note"
                                          : "Введите заметку",
                                      textInputAction: TextInputAction.done,
                                      validation: false,
                                      onSaved: (value) => setState(() =>
                                          _modelInstance.bearingmaximumGapNote =
                                              value!)))
                            ])),
                          ],
                        ),
                        
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 20.0,
                          ),
                          child: Center(
                              child: SizedBox(
                                  child: ElevatedButton(
                            child: Text(Localozation.localization
                                ? "Save"
                                : "Сохранить"),
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            onPressed: () {
                              if (_formKeyForms.currentState!.validate()) {
                                _formKeyForms.currentState!.save();
                                _modelInstance.sendData();
                                bar.show(context);
                                Navigator.pop(context);
                              }
                            },
                          ))),
                        ),
                      ])))),
        ));
  }
}
