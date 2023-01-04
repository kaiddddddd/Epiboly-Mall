import 'package:flutter/material.dart';

// author：kd
// describe：

class ActivityTitle extends StatelessWidget {

  final title;

  ActivityTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          width: 183,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/activity/title.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}
