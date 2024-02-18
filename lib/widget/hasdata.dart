import 'package:flutter/material.dart';

import 'package:todo_app/localdata/data.dart';

Column hasadata(Size size, Data data) {
  return Column(
    children: [Center(child: Text(' ${data.task}'))],
  );
}
