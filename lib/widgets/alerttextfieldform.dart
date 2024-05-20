// import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';

class AlertForm extends StatefulWidget {
  final List<List<String>> items;
  // final List<String> items;
  // final Future<List<String>> items;
  final List<List<String>> selecteditems;
  // final List<String> selecteditems;
  const AlertForm({Key? key, required this.items, required this.selecteditems})
      : super(key: key);

  @override
  _SelectMongodbData createState() => _SelectMongodbData();
}

class _SelectMongodbData extends State<AlertForm> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(List<String> itemValue, bool isSelected) {
    setState(() {
      // print(isSelected);
      if (isSelected) {
        // _selectedItems.add(itemValue);widget.selecteditems.add(itemValue);secondItems.add(itemValue[1]);
        // _selectedItems.add(itemValue);
        widget.selecteditems.add(itemValue);
      } else {
        // _selectedItems.remove(itemValue);widget.selecteditems.remove(itemValue[1]);secondItems.remove(itemValue[1]);

        widget.selecteditems.removeWhere(
            (item) => const ListEquality().equals(item, itemValue));
      }
      print(widget.selecteditems);
      // print(_selectedItems);
      // print(widget.selecteditems);
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    // Navigator.pop(context, _selectedItems);
    // Navigator.pop(context, widget.selecteditems);
  }

  @override
  Widget build(BuildContext context) {
    //  print(widget.selecteditems[1]);
    // List<String> sublist = widget.items[1];

    // print(sublist);
    return AlertDialog(
      title: Text('Enter some text'),
      content: Column(
        children: [
          TextField(
            // expands: true,
            textAlignVertical: TextAlignVertical.top,
            maxLines: null,
            // controller: courseworkcontent,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight:
                    FontWeight.lerp(FontWeight.w500, FontWeight.w400, 0.5),
                overflow: TextOverflow.visible,
              ),
              labelText: 'Content',
              border: const OutlineInputBorder(),
              floatingLabelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight:
                    FontWeight.lerp(FontWeight.w500, FontWeight.w400, 0.5),
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          //  TextField(
          //   controller: _textFieldController,
          //   decoration: InputDecoration(hintText: "Type something here"),
          // ),
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Type something here"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

List<String> flattenList(List<List<String>> nestedList) {
  return nestedList.expand((innerList) => innerList).toList();
}
