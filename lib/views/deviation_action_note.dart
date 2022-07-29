import 'package:flutter/material.dart';
import 'package:work_shop_app/commons/common_forms.dart';
import 'package:work_shop_app/models/deviation_action_note_models.dart';
import 'package:snack/snack.dart';

class DeviationsActionsNotes extends StatefulWidget {
  final String docName;
  @override
  _DeviationsActionsNotes createState() => _DeviationsActionsNotes();
  const DeviationsActionsNotes({Key? key, required this.docName})
      : super(key: key);
}

class _DeviationsActionsNotes extends State<DeviationsActionsNotes> {
  final bar = SnackBar(content: Text(Localozation.localization ? "Data succesfully added" : "Данные успешно добавленны"));
  late final DeviationsActionsNotesModel _modelInstance =
      DeviationsActionsNotesModel(docName: widget.docName);
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
  Widget build(BuildContext context) => WillPopScope(
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
                    
                    Text(
                        Localozation.localization
                            ? "Deviations, actions, notes"
                            : "Замечания, необходимые дейтсвия, заметки",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    
                    Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: TextFormField(
                            maxLines: 15,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                labelText: Localozation.localization ? "Found deviations" : "Найденные замечания",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            onSaved: (value) => setState(
                                () => _modelInstance.deviations = value!))),
                    
                    Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: TextFormField(
                            maxLines: 15,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                labelText: Localozation.localization ? "Required actions" : "Необходимые действия",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            onSaved: (value) => setState(
                                () => _modelInstance.actions = value!))),
                    
                    Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: TextFormField(
                            maxLines: 15,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                labelText: Localozation.localization ? "Notes" : "Заметки",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                            onSaved: (value) =>
                                setState(() => _modelInstance.notes = value!))),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: Center(
                          child: SizedBox(
                              child: ElevatedButton(
                        child: Text(Localozation.localization ? "Save" : "Сохранить"),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder()),
                        onPressed: () {
                          _formKeyForms.currentState!.save();
                          _modelInstance.sendData();
                          bar.show(context);
                          Navigator.pop(context);
                        },
                      ))),
                    ),
                  ])))),
    ));
  }

