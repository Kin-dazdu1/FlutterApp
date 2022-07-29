import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';

import '../models/rewind_form_model.dart';

class RewindingCard extends StatefulWidget {
  final String docName;
  @override
  _RewindingCard createState() => _RewindingCard();
  const RewindingCard({Key? key, required this.docName}) : super(key: key);
}

class _RewindingCard extends State<RewindingCard> {
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Data succesfully added"
          : "Данные успешно добавленны"));
  late final RewindingCardModel _modelInstance =
      RewindingCardModel(docName: widget.docName);
  final _formKeyForms = GlobalKey<FormState>();
  RegExp regexFormm = RegExp(r"(\d+ ?mm)|(\d+\.\d+ ?mm)|(N/A)");
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
                                ? "Rewinding card"
                                : "Карта перемотки",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                        
                        CommonForm(
                          keyBoardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Amount of slots"
                              : "Колличество пазов",
                          emptyValue: Localozation.localization
                              ? "Enter amount of slots"
                              : "Введите количество пазов",
                          onSaved: (value) => setState(
                              () => _modelInstance.slotsAmount = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText:
                              Localozation.localization ? "Heating" : "Нагрев",
                          emptyValue: Localozation.localization
                              ? "Enter heating"
                              : "Введите нагрев",
                          onSaved: (value) =>
                              setState(() => _modelInstance.heating = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Number of phases slot"
                              : "Колличество пазов на фазу",
                          emptyValue: Localozation.localization
                              ? "Enter number of phases slot"
                              : "Введите колличество пазов на фазу",
                          onSaved: (value) =>
                              setState(() => _modelInstance.numberOPS = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Temp. feeler"
                              : "Температурный датчик",
                          emptyValue: Localozation.localization
                              ? "Enter temp. feeler"
                              : "Введите температрный датчик",
                          onSaved: (value) => setState(
                              () => _modelInstance.tempFeeler = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          regEx: regexFormm,
                          regExFormat: Localozation.localization
                              ? "valid format: 120 mm or N/A"
                              : "Принимаемый формат: 120 mm или N/A",
                          labelText: Localozation.localization
                              ? "Length lead of windings - out cable"
                              : "Расстояние катушки от стержня DE",
                          emptyValue: Localozation.localization
                              ? "Enter length lead of windings - out cable"
                              : "Введите расстояние катушки от стержня DE",
                          onSaved: (value) => setState(() => _modelInstance
                              .lengthLO = regexFormm.stringMatch(value!)!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          regEx: regexFormm,
                          regExFormat: Localozation.localization
                              ? "valid format: 120 mm or N/A"
                              : "Принимаемый формат: 120 mm или N/A",
                          labelText: Localozation.localization
                              ? "Length lead of windings - none out cable"
                              : "Расстояние катушки от стержня NDE",
                          emptyValue: Localozation.localization
                              ? "Enter length lead of windings - none out cable"
                              : "Введите расстояние катушки от стержня NDE",
                          onSaved: (value) => setState(() => _modelInstance
                              .lengthLNO = regexFormm.stringMatch(value!)!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Wire diameter old"
                              : "Диаметр старого провода",
                          emptyValue: Localozation.localization
                              ? "Enter wire diameter old"
                              : "Введите диаметр старовго провода",
                          onSaved: (value) => setState(() => _modelInstance
                              .wireDiametrO = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Wire diameter new"
                              : "Диаметр нового провода",
                          emptyValue: Localozation.localization
                              ? "Enter wire diameter new"
                              : "Введите диаметр нового провода",
                          onSaved: (value) => setState(() => _modelInstance
                              .wireDiametrN = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Amount wires old"
                              : "Колличество старых проводов",
                          emptyValue: Localozation.localization
                              ? "Enter amount wires old"
                              : "Введите колличество старых проводов",
                          onSaved: (value) =>
                              setState(() => _modelInstance.amountWO = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Amount wires new"
                              : "Колличество проводов новых",
                          emptyValue: Localozation.localization
                              ? "Enter amount wires new"
                              : "Введите колличество новых проводов",
                          onSaved: (value) =>
                              setState(() => _modelInstance.amountWN = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          regEx: regexFormm,
                          regExFormat: Localozation.localization
                              ? "valid format: 120 mm or N/A"
                              : "Принимаемый формат: 120 mm или N/A",
                          labelText: Localozation.localization
                              ? "Length of lamination"
                              : "Длина статора",
                          emptyValue: Localozation.localization
                              ? "Enter length of lamination"
                              : "Введите длину статора",
                          onSaved: (value) => setState(() => _modelInstance
                              .lengthOL = regexFormm.stringMatch(value!)!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Amount of bars"
                              : "Колличество шин",
                          emptyValue: Localozation.localization
                              ? "Enter amount of bars"
                              : "Введите колличество шин",
                          onSaved: (value) =>
                              setState(() => _modelInstance.amountOB = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Amount of windings coil/slot"
                              : "Колличество витков/пазов",
                          emptyValue: Localozation.localization
                              ? "Enter amount of windings coil/slot"
                              : "Введите колличество витков",
                          onSaved: (value) =>
                              setState(() => _modelInstance.amointW = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Span equipitential"
                              : "Интервал эквопотонциаля",
                          emptyValue: Localozation.localization
                              ? "Enter span equipitential"
                              : "Введите интервал эквопотонциаля",
                          onSaved: (value) =>
                              setState(() => _modelInstance.spanE = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Number equipotentional"
                              : "Колличество эквопотонциаля",
                          emptyValue: Localozation.localization
                              ? "Enter number equipotentional"
                              : "Введите колличество эквопотонциаля",
                          onSaved: (value) => setState(
                              () => _modelInstance.numberspanE = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Step winding (DC)"
                              : "Шан обомтки (постоянный ток)",
                          emptyValue: Localozation.localization
                              ? "Enter step winding (DC)"
                              : "Введите шаг обмотки (постоянный ток)",
                          onSaved: (value) => setState(
                              () => _modelInstance.windingStepDC = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText:
                              Localozation.localization ? "Circuit" : "Цепь",
                          emptyValue: Localozation.localization
                              ? "Enter circuit"
                              : "Введите цепь",
                          onSaved: (value) =>
                              setState(() => _modelInstance.circuit = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Wire diameter"
                              : "Диаметр провода",
                          emptyValue: Localozation.localization
                              ? "Enter wire diameter"
                              : "Введите диаметр провода",
                          onSaved: (value) => setState(() => _modelInstance
                              .diametr = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Step winding (AC)"
                              : "Шаг обмотки переменный ток",
                          emptyValue: Localozation.localization
                              ? "Enter step winding (AC)"
                              : "Введите шаг обмотки переменный ток",
                          onSaved: (value) =>
                              setState(() => _modelInstance.stepW = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          regEx: regexFormm,
                          regExFormat: Localozation.localization
                              ? "valid format: 120 mm or N/A"
                              : "Принимаемый формат: 120 mm или N/A",
                          labelText: Localozation.localization
                              ? "Diameter of lamination"
                              : "Диаметр статора",
                          emptyValue: Localozation.localization
                              ? "Enter diameter of lamination"
                              : "Введите диаметр статора",
                          onSaved: (value) => setState(() => _modelInstance
                              .diametrOL = regexFormm.stringMatch(value!)!),
                        ),
                        
                        SwitchListTile(
                            title: Text(Localozation.localization
                                ? "Lamination repaired"
                                : "Ламинирование отремонтированна"),
                            value: _modelInstance.laminationR,
                            onChanged: (bool value) => setState(
                                () => _modelInstance.laminationR = value)),
                        
                        SwitchListTile(
                            title: Text(Localozation.localization
                                ? "Lamination tested"
                                : "Ламинирование проверенно"),
                            value: _modelInstance.laminationT,
                            onChanged: (bool value) => setState(
                                () => _modelInstance.laminationT = value)),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Amount of hours"
                              : "Колличество часов",
                          emptyValue: Localozation.localization
                              ? "Enter amount of hours"
                              : "Введите колличество часов",
                          onSaved: (value) =>
                              setState(() => _modelInstance.amountOH = value!),
                        ),
                        
                        SwitchListTile(
                            title: Text(Localozation.localization
                                ? "Circuit drive right way"
                                : "Направление цепи верно"),
                            value: _modelInstance.circuitDRW,
                            onChanged: (bool value) => setState(
                                () => _modelInstance.circuitDRW = value)),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Type slot Wedges"
                              : "Тип пазового клина",
                          emptyValue: Localozation.localization
                              ? "Enter type slot Wedges"
                              : "Введите тип пазового клина",
                          onSaved: (value) =>
                              setState(() => _modelInstance.typeSW = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Rotor magnetization"
                              : "Намагничеване ротора",
                          emptyValue: Localozation.localization
                              ? "Enter rotor magnetization"
                              : "Введите намагничивание ротора",
                          onSaved: (value) =>
                              setState(() => _modelInstance.rotorM = value!),
                        ),
                        
                        CommonForm(
                          validation: false,
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText:
                              Localozation.localization ? "Class" : "Класс",
                          emptyValue: Localozation.localization
                              ? "Enter class"
                              : "Введите класс",
                          onSaved: (value) =>
                              setState(() => _modelInstance.clas = value!),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          labelText: Localozation.localization
                              ? "Rewind technician"
                              : "Обмотчик",
                          emptyValue: Localozation.localization
                              ? "Enter rewind technician"
                              : "Введите обмотчика",
                          onSaved: (value) =>
                              setState(() => _modelInstance.rewindT = value!),
                        ),
                        
                        Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 15.0,
                            ),
                            child: TextFormField(
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                labelText: Localozation.localization
                                    ? "Remarks"
                                    : "Уточнения",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onSaved: (value) => setState(
                                  () => _modelInstance.remarks = value!),
                            )),
                        
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
                              ),
                            ))),
                      ])))),
        ));
  }
}
