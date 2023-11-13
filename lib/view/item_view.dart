// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class itemViewPage extends StatefulWidget {
  String? name;
  String? id;
  String? arab;
  String? number;
  itemViewPage(
      {Key? key,
      required this.name,
      required this.id,
      required this.arab,
      required this.number})
      : super(key: key);

  @override
  State<itemViewPage> createState() => _itemViewPageState();
}

class _itemViewPageState extends State<itemViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 26, 109, 29),
        title: Text('${widget.name} ~ [ ${widget.number} ]'),
        actions: const [],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/img/bg.png"), fit: BoxFit.cover),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.arab!,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text('Artinya :',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  widget.id!,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
