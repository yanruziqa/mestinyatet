import 'package:flutter/material.dart';

import 'package:mestinyatet/Component/button.dart';
import 'package:mestinyatet/Component/heading.dart';
import 'package:mestinyatet/Screen/gratitude.dart';
import 'package:mestinyatet/Screen/view.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart' as intl;

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.db,
    required this.dailyList,
  });

  final Database db;
  final List dailyList;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void addJournal() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Gratitude(
          db: widget.db,
        ),
      ),
    ).then(
      (value) => {
        getDaily().then(
          (value) => {
            setState(() {
              dailyList = List.from(value);
            })
          },
        )
      },
    );
  }

  void viewJournal(Map curr) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewJournal(
          curr: curr,
        ),
      ),
    );
  }

  late List dailyList;

  @override
  void initState() {
    super.initState();
    dailyList = widget.dailyList;
  }

  Future getDaily() async {
    var res = await widget.db.query('daily');
    return res;
  }

  Widget welcomeScreen() {
    if (dailyList.isEmpty) {
      return Image.asset('assets/images/logo_start.jpg');
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Center(
            child: Heading("Jurnal Kamu"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dailyList.length,
              itemBuilder: (BuildContext context, int index) {
                var date = DateTime.parse(dailyList[index]['timestamp']);
                var tgl = intl.DateFormat.Hm().format(date);
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text("Pukul $tgl"),
                      leading: CircleAvatar(
                        child: Text(
                          intl.DateFormat.d().format(date),
                        ),
                      ),
                      trailing: PrimaryButton(
                        action: () {
                          viewJournal(dailyList[index]);
                        },
                        teks: "Lihat",
                        icon: Icons.arrow_right_rounded,
                        direction: TextDirection.rtl,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: welcomeScreen(),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PrimaryButton(
                  teks: "Mulai Mencatat",
                  icon: Icons.keyboard_double_arrow_down,
                  action: addJournal,
                  direction: TextDirection.ltr,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
