import 'package:flutter/material.dart';

class SpecSelector extends StatefulWidget {
  const SpecSelector({Key? key}) : super(key: key);

  @override
  _SpecSelectorState createState() => _SpecSelectorState();
}

class _SpecSelectorState extends State<SpecSelector> {
  List<Map<String, dynamic>> _specData = [
    {"select": false, "text": "50ml"},
    {"select": true, "text": "5000ml"},
    {"select": false, "text": "100ml"},
  ];

  @override
  Widget build(BuildContext context) {
    int index = -1;
    return Wrap(
      spacing: 30,
      runSpacing: 10,
      children: _specData.map((e) {
        index += 1;
        return _buildItem(index, e);
      }).toList(),
    );
  }

  Widget _buildItem(index, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _specData.forEach((element) {
            element["select"] = false;
          });
          _specData[index]["select"] = true;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        decoration: BoxDecoration(
          color: item["select"] ? Color(0xfff9edeb) : Color(0xFFF2f2f2),
          border: Border.all(
            color: item["select"] ? Color(0xffea574b) : Color(0xFFF2f2f2),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          item["text"],
          style: TextStyle(
            color: item["select"] ? Color(0xFFFD4841) : Colors.black,
          ),
        ),
      ),
    );
  }
}
