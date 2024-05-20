import 'package:flutter/material.dart';

class DropDownContentButton extends StatefulWidget {
  final String title;

  const DropDownContentButton({Key? key, required this.title})
      : super(key: key);

  @override
  _DropDownContentButtonState createState() => _DropDownContentButtonState();
}

class _DropDownContentButtonState extends State<DropDownContentButton> {
  bool isContentVisible = false;
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double
              .infinity, // Make the width of the content match its parent button
          child: OutlinedButton(
              onPressed: () {
                setState(() {
                  isContentVisible = !isContentVisible;
                });
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity,
                      48), // Set the width to fill the available space
                ),
              ),
              // child: Text(widget.title),
              //  OutlinedButton.styleFrom(
              //     side: BorderSide(
              //       color: Colors.blue, // Border color
              //       width: 2.0, // Border width
              //     ),
              //   ),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              )),
        ),
        if (isContentVisible)
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Content for ${widget.title}'),
                SizedBox(height: 10),
                TextField(
                  controller: textController1,
                  decoration: InputDecoration(
                    labelText: 'Text Input 1',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: textController2,
                  decoration: InputDecoration(
                    labelText: 'Text Input 2',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
