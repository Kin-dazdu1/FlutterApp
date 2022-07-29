import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:work_shop_app/models/initial_form_model.dart';

import 'package:work_shop_app/commons/common_forms.dart';
import 'package:snack/snack.dart';


class InitialFormAsync extends StatefulWidget {
  
  
  
  String requestNumber = "N/A";
  String serialNumber = "N/A";
  bool addSwitch;
  @override
  _InitialFormAsync createState() => _InitialFormAsync();
  InitialFormAsync(
      {Key? key,
      required this.addSwitch,
      required this.requestNumber,
      required this.serialNumber})
      : super(key: key);
}

class _InitialFormAsync extends State<InitialFormAsync> {
  
  
  
  late final InitialForm _modelInstance =
      InitialForm(widget.requestNumber, widget.serialNumber);
  final _formKey = GlobalKey<FormState>();
  
  
  final bar = SnackBar(
      content: Text(Localozation.localization
          ? "Data succesfully added"
          : "Данные были успешно добавленны"));
  final barNotOk = SnackBar(
      content: Text(Localozation.localization
          ? "Motor already in database"
          : "Двигатель уже есть в базе данных"));
  
  RegExp expVoltage =
      RegExp(r"(\d+ ?V)|(\d+\.\d+ ?V)|(\d+ ?kV)|(\d+\.\d+ ?kV)|(N/A)");
  
  RegExp expVoltageR =
      RegExp(r"(\d+ ?V)|(\d+\.\d+ ?V)|(\d+ ?kV)|(\d+\.\d+ ?kV)|(N/A)");
  
  RegExp expDuty = RegExp(r"(S\d{1})|(N/A)");
  
  RegExp expNominalCurrent =
      RegExp(r"(\d+ ?A)|(\d+\.\d+ ?A)|(\d+ ?kA)|(\d+\.\d+ ?kA)|(N/A)");
  
  RegExp expRotorCurrent =
      RegExp(r"(\d+ ?A)|(\d+\.\d+ ?A)|(\d+ ?kA)|(\d+\.\d+ ?kA)|(N/A)");
  
  RegExp expPower =
      RegExp(r"(\d+ ?W)|(\d+\.\d+ ?W)|(\d+ ?kW)|(\d+\.\d+ ?kW)|(N/A)");
  
  RegExp expFrequency = RegExp(r"(\d+ ?Hz)|(\d+\.\d+ ?Hz)(N/A)");
  
  RegExp expRPM = RegExp(r"(\d+ ?RPM)|(\d+\.\d+ ?RPM)|(N/A)");
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
                    key: _formKey,
                    child: ListView(
                      cacheExtent: 20000000,
                      children: [
                        
                        Center(child: Text(
                            Localozation.localization
                                ? "Initial information of entry card"
                                : "Вводная информация карты входного контроля",
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold))),
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        SwitchListTile(
                            title: Text(
                                Localozation.localization
                                    ? "Ex motor"
                                    : "Ex двигатель",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            value: _modelInstance.exSwitch,
                            onChanged: (bool value) => setState(
                                () => _modelInstance.exSwitch = value)),
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization
                              ? "Customer"
                              : "Заказчик",
                          emptyValue: Localozation.localization
                              ? "Enter customer"
                              : "Введите заказчика",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(
                              () => _modelInstance.customer = value),
                        ),
                        
                        if (!widget.addSwitch)
                          CommonForm(
                            keyBoardType: TextInputType.number,
                            labelText: Localozation.localization
                                ? "Request number"
                                : "Номер заявки",
                            emptyValue: Localozation.localization
                                ? "Enter request number"
                                : "Введите номер заявки",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(
                                () => _modelInstance.requestNumber = value),
                          ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization
                              ? "Tag number"
                              : "Таговый номер",
                          emptyValue: Localozation.localization
                              ? "Enter tag number value"
                              : "Введите таговый номер",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) =>
                              setState(() => _modelInstance.tagNumber = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization
                              ? "Manufacturer"
                              : "Производитель",
                          emptyValue: Localozation.localization
                              ? "Enter manufacturer"
                              : "Введите производителя",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(
                              () => _modelInstance.manufacturer = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization
                              ? "Nominal voltage"
                              : "Напряжение",
                          emptyValue: Localozation.localization
                              ? "Enter nominal voltage in valid format"
                              : "Введите напряжение",
                          regEx: expVoltage,
                          regExFormat: Localozation.localization
                              ? "Valid format: 400 V or 400/600 V or N/A"
                              : "Принимаемый формат: 400 V или 400/690 V или N/A",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(() => _modelInstance
                              .voltage = expVoltage.stringMatch(value!)),
                        ),
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization ? "Type" : "Тип",
                          emptyValue: Localozation.localization
                              ? "Enter type"
                              : "Введите тип",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) =>
                              setState(() => _modelInstance.type = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization ? "Nominal current" : "Номинальный ток",
                          emptyValue: Localozation.localization 
                          ? "Enter nominal current in valid format"
                          : "Введите номинальный ток",
                          regEx: expNominalCurrent,
                          regExFormat:
                              Localozation.localization 
                              ? "Valid format: 100 A or 100/200 A or N/A"
                              : "Принимаемый формат: 100 A или 100/200 A или N/A",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(() =>
                              _modelInstance.nominalCurrent =
                                  expNominalCurrent.stringMatch(value!)),
                        ),
                        
                        if (!widget.addSwitch)
                          CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization 
                            ? "Serial number"
                            : "Серийный номер",
                            emptyValue: Localozation.localization 
                            ? "Enter serial number"
                            : "Введите серийный номер",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) => setState(
                                () => _modelInstance.serialNumber = value),
                          ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Frequency"
                          : "Частота питания",
                          emptyValue: Localozation.localization 
                          ? "Enter frequency in valid format"
                          : "Введите частоту питания",
                          regEx: expFrequency,
                          regExFormat: Localozation.localization 
                          ? "Valid format: 50 Hz or N/A"
                          : "Принимаемый формат: 50 Hz или N/A",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(() => _modelInstance
                              .frequency = expFrequency.stringMatch(value!)),
                        ),
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Power"
                          : "Мощность",
                          emptyValue: Localozation.localization 
                          ? "Enter power in valid format"
                          : "Введите мощность",
                          regEx: expPower,
                          regExFormat: Localozation.localization 
                          ? "Valid format: 37 kW or 37 W or N/A"
                          : "Принимаемый формат: 37 kW или 37 W или N/A",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(() => _modelInstance
                              .power = expPower.stringMatch(value!)),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Insulation class"
                          : "Класс изоляции",
                          emptyValue: Localozation.localization 
                          ? "Enter insulation class"
                          : "Введите класс изоляции",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) =>
                              setState(() => _modelInstance.insClass = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: "RPM",
                          emptyValue: Localozation.localization 
                          ? "Enter RPM in valid format"
                          : "Введите RPM",
                          regEx: expRPM,
                          regExFormat: Localozation.localization 
                          ? "Valid format: 1490 RPM or N/A"
                          : "Приниаемый формат: 1490 RPM или N/A",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(() =>
                              _modelInstance.rpm = expRPM.stringMatch(value!)),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Type of de bearing"
                          : "Тип DE подшибника",
                          emptyValue: Localozation.localization 
                          ? "Enter type of de bearing"
                          : "Введите тип DE подшибника",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) =>
                              setState(() => _modelInstance.deBearing = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Type of NDE bearing"
                          : "Тип NDE подшибника",
                          emptyValue: Localozation.localization 
                          ? "Enter type of NDE bearing"
                          : "Введите тип NDE подшибника",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) =>
                              setState(() => _modelInstance.ndeBearing = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Type of grease"
                          : "Тип смазки",
                          emptyValue: Localozation.localization 
                          ? "Enter type of grease"
                          : "Введите тип смазки",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) =>
                              setState(() => _modelInstance.greaseType = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Duty"
                          : "Режим работы",
                          emptyValue: Localozation.localization 
                          ? "Enter duty in valid format"
                          : "Введите режим работы",
                          regEx: expDuty,
                          regExFormat: Localozation.localization 
                          ? "Valid format: S1 or N/A"
                          : "Принимаемый формат: S1 или S3 или N/A",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(() => _modelInstance
                              .duty = expDuty.stringMatch(value!)),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Transformation ratio"
                          : "Коэффициент трансформации",
                          emptyValue: Localozation.localization 
                          ? "Enter transformation ratio"
                          : "Введите коэффициент трансформации",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(
                              () => _modelInstance.ctRationClass = value),
                        ),
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: Localozation.localization 
                          ? "Year of manufacture"
                          : "Год производства",
                          emptyValue: Localozation.localization 
                          ? "Enter year of manufacture"
                          : "Введите год производства",
                          textInputAction: TextInputAction.next,
                          onSaved: (value) => setState(
                              () => _modelInstance.yearOfManuf = value),
                        ),
                        
                        CommonForm(
                          keyBoardType: TextInputType.text,
                          labelText: "IP",
                          emptyValue: Localozation.localization 
                          ? "Enter IP rate"
                          : "Введите IP",
                          textInputAction: TextInputAction.done,
                          onSaved: (value) =>
                              setState(() => _modelInstance.ipRate = value),
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Localozation.localization 
                            ? "Сonnection type:"
                            : "Тип подключения",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            DDBCommon(
                              initialDrop: _modelInstance.connectionDDrop!,
                              iterList: _modelInstance.connectionItems,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _modelInstance.connectionDDrop = newValue!;
                                });
                              },
                            )
                          ],
                        ),
                        
                        if (_modelInstance.exSwitch)
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Localozation.localization 
                              ? 'Type of Ex:'
                              : "Тип Ex",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              DDBCommon(
                                initialDrop: _modelInstance.exTypeDrop,
                                iterList: _modelInstance.exTypeDropItems,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _modelInstance.exTypeDrop = newValue!;
                                  });
                                },
                              )
                            ],
                          ),
                        
                        if (_modelInstance.exSwitch)
                          (CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization 
                            ? "Ex rating"
                            : "Ex степень",
                            emptyValue: Localozation.localization 
                            ? "Enter Ex rating"
                            : "Введите Ex степень",
                            textInputAction: TextInputAction.next,
                            onSaved: (value) =>
                                setState(() => _modelInstance.exRating = value),
                          )),
                        
                        if (_modelInstance.exSwitch)
                          (CommonForm(
                            keyBoardType: TextInputType.text,
                            labelText: Localozation.localization 
                            ? "Ex certificate number"
                            : "Номер Ex сертификата",
                            emptyValue: Localozation.localization 
                            ? "Enter Ex certificate number"
                            : "Введите номер Ex сертификата",
                            textInputAction: TextInputAction.done,
                            onSaved: (value) =>
                                setState(() => _modelInstance.exNum = value),
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
                                  
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      
                                      
                                      
                                      final dataOld = await getMap(
                                          "R:${_modelInstance.requestNumber};SN:${_modelInstance.serialNumber}",
                                          "State");
                                      
                                      if (dataOld == null) {
                                        _modelInstance.sendData();
                                        bar.show(context);
                                        Navigator.pop(context);
                                      } else {
                                        
                                        
                                        if (widget.addSwitch) {
                                          final dataNew =
                                              _modelInstance.getDataMap();
                                          for (var i in dataOld.keys) {
                                            
                                            
                                            if (i != "entryTable") {
                                              
                                              
                                              if (i == "rewindingForm") {
                                                dataNew.update(
                                                    i, (value) => dataOld[i],
                                                    ifAbsent: () => dataOld[i]);
                                              }
                                              if (dataNew.keys.contains(i)) {
                                                dataNew.update(
                                                    i, (value) => dataOld[i]);
                                              }
                                            }
                                          }
                                          _modelInstance
                                              .sendDataStateByMap(dataNew);
                                          bar.show(context);
                                          Navigator.pop(context);
                                        }
                                        
                                        
                                        
                                        else {
                                          barNotOk.show(context);
                                          Navigator.pop(context);
                                        }
                                      }
                                    }
                                  }),
                            )))
                      ],
                    )),
              ),
            )));
  }
}


Future<Map<String, dynamic>?> getMap(String docName, String collection) async {
  Map<String, dynamic>? dataMap;
  CollectionReference reference = Firestore.instance.collection(collection);
  DocumentReference dataRef = reference.document(docName);
  if (await dataRef.exists) {
    Document document = await dataRef.get();
    return document.map;
  }
  return dataMap;
}
