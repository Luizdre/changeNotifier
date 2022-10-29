import 'package:flutter/material.dart';
import 'package:teste/model/person.dart';
import 'package:teste/second/second_controller.dart';

class SecondPage extends StatefulWidget {
  Person? person;
  SecondPage({Key? key, this.person}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SecondController controller = SecondController();
  @override
  void initState() {
    controller.person = widget.person!;
    // controller.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 500,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: controller.person!.imagem!.length,
                itemBuilder: (context, i) => InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.memory(controller.person!.imagem![i]),
                      ),
                      onTap: () => setState(() => controller
                          .selectImage(controller.person!.imagem![i])),
                    )),
          ),
          SizedBox(
            width: 1000,
            child: controller.imageSelected != null
                ? Image.memory(controller.imageSelected!)
                : const Center(
                    child: Text('Nada'),
                  ),
          )
        ],
      ),
    );
  }
}
