// ignore_for_file: prefer_const_constructors, file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, unnecessary_import, unnecessary_new, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_field, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ManageDetailAcc extends StatefulWidget {
  const ManageDetailAcc({super.key});

  @override
  State<ManageDetailAcc> createState() => _ManageDetailAccState();
}

class _ManageDetailAccState extends State<ManageDetailAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Detail Account"),
      ),
      body: Container(),
    );
  }
}