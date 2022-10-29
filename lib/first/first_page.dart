import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:teste/first/first_controller.dart';
import 'package:teste/second/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final FirstController controller = FirstController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
    controller.listPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        child: controller.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.persons!.length,
                itemBuilder: (context, i) => GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondPage(
                                person: controller.persons![i],
                              ))),
                      child: Text(controller.persons![i].nome!),
                    )),
      ),
    );
  }
}
