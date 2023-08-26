import 'package:flutter/material.dart';
import 'package:mestinyatet/Component/button.dart';
import 'package:mestinyatet/Component/heading.dart';
import 'package:mestinyatet/Component/regular_text.dart';
import 'package:mestinyatet/Data/static_text.dart';
import 'package:sqflite/sqflite.dart';

class Gratitude extends StatefulWidget {
  const Gratitude({
    super.key,
    required this.db,
  });

  final Database db;

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  int index = 0;
  late Widget rightButton, leftButton;
  final myController = TextEditingController();

  late Widget prevButton = PrimaryButton(
    teks: "",
    icon: Icons.arrow_left,
    action: prevScreen,
    direction: TextDirection.ltr,
  );

  late Widget nextButton = PrimaryButton(
    teks: "",
    icon: Icons.arrow_right,
    action: nextScreen,
    direction: TextDirection.rtl,
  );

  late Widget doneButton = PrimaryButton(
    teks: "",
    icon: Icons.check,
    action: () {
      staticTextCollection.getByIndex(index).setData(myController.text);
      staticTextCollection.save(widget.db);
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Berhasil"),
          content: const Text("Data berhasil disimpan"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Oke"),
            )
          ],
        ),
      );
    },
    direction: TextDirection.rtl,
  );

  @override
  void initState() {
    super.initState();
    index = 0;
    rightButton = nextButton;
    leftButton = Visibility(
      visible: false,
      child: prevButton,
    );
    myController.text = staticTextCollection.getByIndex(index).data;
  }

  void nextScreen() {
    leftButton = prevButton;
    if (index == (staticTextCollection.length() - 2)) {
      rightButton = doneButton;
    }
    staticTextCollection.getByIndex(index).setData(myController.text);
    myController.clear();
    setState(() {
      index++;
    });
    myController.text = staticTextCollection.getByIndex(index).data;
  }

  void prevScreen() {
    if (index == 1) {
      leftButton = Visibility(
        visible: false,
        child: prevButton,
      );
    }
    rightButton = nextButton;
    setState(() {
      index--;
    });
    myController.text = staticTextCollection.getByIndex(index).data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Heading(
                  staticTextCollection.getByIndex(index).heading,
                ),
                RegularText(
                  staticTextCollection.getByIndex(index).desc,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: TextFormField(
                    controller: myController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: staticTextCollection.getByIndex(index).label,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                leftButton,
                rightButton,
              ],
            )
          ],
        ),
      ),
    );
  }
}
