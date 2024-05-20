import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  // final List<List<String>> items;
  final List<String> items;
  // final Future<List<String>> items;
  // final List<List<String>> selecteditems;
  final List<String> selecteditems;
  const MultiSelect(
      {Key? key, required this.items, required this.selecteditems})
      : super(key: key);

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  // final List<List<String>> _selectedItems = [];// repair herere
  // final List<List<String>> _selectedItems = widget.selecteditems;// repair herere

  // final List<List<String>> _selectedItems = [];
  final List<String> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    // _selectedItems = [];
    print(widget.selecteditems.toString());
    // final List<List<String>> _selectedItems = widget.selecteditems;

    // _itemChange(flattenList(widget.selecteditems), widget.selecteditems.contains(widget.items));

    print(_selectedItems);
  }

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
        widget.selecteditems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
        widget.selecteditems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    // Navigator.pop(context, _selectedItems);
    Navigator.pop(context, widget.selecteditems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: widget.selecteditems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
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
