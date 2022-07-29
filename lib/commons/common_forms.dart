import 'package:flutter/material.dart';

class Localozation {
  static bool localization = true;
}

class CommonForm extends StatefulWidget {
  final TextInputType keyBoardType;
  final String labelText;
  final String emptyValue;
  final void Function(String?)? onSaved;
  final RegExp? regEx;
  final String? regExFormat;
  final TextInputAction textInputAction;
  final bool? validation;
  const CommonForm({
    Key? key,
    required this.keyBoardType,
    required this.labelText,
    required this.emptyValue,
    required this.onSaved,
    required this.textInputAction,
    this.regEx,
    this.regExFormat,
    this.validation,
  }) : super(key: key);
  @override
  _CommonForm createState() => _CommonForm();
}

class _CommonForm extends State<CommonForm> {
  final _myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 15.0,
        ),
        child: TextFormField(
          textInputAction: widget.textInputAction,
          controller: _myController,
          keyboardType: widget.keyBoardType,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          validator: (value) {
            if (widget.validation == null) {
              if (value!.isEmpty) {
                return widget.emptyValue;
              }
            }
            if (widget.keyBoardType == TextInputType.number) {
              try {
                double.parse(_myController.text);
              } on FormatException {
                return Localozation.localization 
                ? "Has to be double"
                : "Принимает только числа";
              }
            }
            // widget.regEx! this thing took 2 days...
            if (widget.regEx != null) {
              if (widget.regEx!.stringMatch(_myController.text) == null) {
                return widget.regExFormat;
              }
            }
            return null;
          },
          onSaved: widget.onSaved,
        ));
  }
}

class DDBCommon extends StatefulWidget {
  final String initialDrop;
  final List<String> iterList;
  final void Function(String?)? onChanged;
  const DDBCommon({
    Key? key,
    required this.initialDrop,
    required this.iterList,
    required this.onChanged,
  }) : super(key: key);
  @override
  _DDBCommon createState() => _DDBCommon();
}

class _DDBCommon extends State<DDBCommon> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      elevation: 16,
      // style: const TextStyle(color: Colors.deepPurple),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      value: widget.initialDrop,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: widget.iterList.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}

class CommonColumnForTables extends StatefulWidget {
  final String initialDrop;
  final List<String> iterList;
  final String textOfWidget;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  const CommonColumnForTables({
    Key? key,
    required this.initialDrop,
    required this.iterList,
    required this.textOfWidget,
    required this.onChanged,
    required this.onSaved,
  }) : super(key: key);
  @override
  _CommonColumnForTables createState() => _CommonColumnForTables();
}

class _CommonColumnForTables extends State<CommonColumnForTables> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.textOfWidget),
          DDBCommon(
              initialDrop: widget.initialDrop,
              iterList: widget.iterList,
              onChanged: widget.onChanged)
        ],
      ),
      // Condition of drive end bearing seat note
      if (widget.initialDrop == "NOT OK" || widget.initialDrop == "OK see note")
        CommonForm(
            keyBoardType: TextInputType.text,
            labelText: "Note",
            emptyValue: "Enter note",
            textInputAction: TextInputAction.done,
            onSaved: widget.onSaved)
    ]);
  }
}

class CommonFormForReapirProtocol extends StatefulWidget {
  final String initialDropRR;
  final String initialDropM;
  final List<String> iterListRR;
  final List<String> iterListM;
  final void Function(String?)? onChangedRR;
  final void Function(String?)? onChangedM;
  final void Function(String?)? onSavedNote;
  final void Function(String?)? onSavedCBD;
  final String sectionName;
  const CommonFormForReapirProtocol({
    Key? key,
    required this.initialDropRR,
    required this.initialDropM,
    required this.iterListRR,
    required this.iterListM,
    required this.sectionName,
    required this.onChangedRR,
    required this.onChangedM,
    required this.onSavedNote,
    required this.onSavedCBD,
  }) : super(key: key);
  @override
  _CommonFormForReapirProtocol createState() => _CommonFormForReapirProtocol();
}

class _CommonFormForReapirProtocol extends State<CommonFormForReapirProtocol> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(children: [
      SizedBox(
          width: width / 10,
          child: Text(widget.sectionName + ": ",
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
      Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            (Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Repaired/Replaced"),
                DDBCommon(
                    initialDrop: widget.initialDropRR,
                    iterList: widget.iterListRR,
                    onChanged: widget.onChangedRR),
                if (widget.initialDropRR != "N/A") const Text("Modified"),
                if (widget.initialDropRR != "N/A")
                  DDBCommon(
                      initialDrop: widget.initialDropM,
                      iterList: widget.iterListM,
                      onChanged: widget.onChangedM)
              ],
            )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              if (widget.initialDropRR != "N/A")
                Flexible(
                    child: CommonForm(
                        keyBoardType: TextInputType.text,
                        labelText: Localozation.localization 
                        ? "Comment"
                        : "Комментарий",
                        emptyValue: Localozation.localization 
                        ? "Enter comment"
                        : "Введите комментарий",
                        textInputAction: TextInputAction.next,
                        onSaved: widget.onSavedNote)),
              if (widget.initialDropRR != "N/A")
                Flexible(
                    child: CommonForm(
                        keyBoardType: TextInputType.text,
                        labelText: Localozation.localization 
                        ? "Completed by/ Date "
                        : "Выполнено/ Дата ",
                        emptyValue: Localozation.localization 
                        ? "Enter who performed reapir and date"
                        : "Введите кто выполнил ремонт и дату",
                        textInputAction: TextInputAction.done,
                        onSaved: widget.onSavedCBD))
            ])
          ]))
    ]);
  }
}
