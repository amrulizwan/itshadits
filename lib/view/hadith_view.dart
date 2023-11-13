// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:itshadits/model/hadith_model.dart';
import 'package:itshadits/repo/hadith_repo.dart';
import 'package:itshadits/view/item_view.dart';

class HadithViewPage extends StatefulWidget {
  final String id;
  final String name;

  const HadithViewPage({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<HadithViewPage> createState() => _HadithViewPageState();
}

class _HadithViewPageState extends State<HadithViewPage> {
  String? range1;
  String? range2;
  String? range3;
  String? range4;
  String? range5;
  String? range6;
  String? range7;
  List<Hadith> rangeSatu = [];
  List<Hadith> rangeDua = [];
  List<Hadith> rangeTiga = [];
  List<Hadith> rangeEmpat = [];
  List<Hadith> rangeLima = [];
  List<Hadith> rangeEnam = [];
  List<Hadith> rangeTujuh = [];
  List<Hadith> listHadiths = [];
  RepoHadith repository = RepoHadith();

  getRange() {
    if (widget.id == 'abu-daud') {
      range1 = '1-629';
      range2 = '630-1258';
      range3 = '1259-1887';
      range4 = '1888-2516';
      range5 = '2517-3145';
      range6 = '3146-3774';
      range7 = '3775-4419';
    }
    if (widget.id == 'ahmad') {
      range1 = '1-615';
      range2 = '616-1230';
      range3 = '1231-1845';
      range4 = '1846-2460';
      range5 = '2461-3075';
      range6 = '3076-3690';
      range7 = '3691-4305';
    }
    if (widget.id == 'bukhari') {
      range1 = '1-1000';
      range2 = '1001-2000';
      range3 = '2001-3000';
      range4 = '3001-4000';
      range5 = '4001-5000';
      range6 = '5001-6000';
      range7 = '6001-6638';
    }
    if (widget.id == 'darimi') {
      range1 = '1-421';
      range2 = '422-842';
      range3 = '843-1263';
      range4 = '1264-1684';
      range5 = '1685-2105';
      range6 = '2106-2526';
      range7 = '2527-2949';
    }
    if (widget.id == 'ibnu-majah') {
      range1 = '1-612';
      range2 = '613-1225';
      range3 = '1226-1838';
      range4 = '1839-2451';
      range5 = '2452-3064';
      range6 = '3065-3677';
      range7 = '3678-4285';
    }
    if (widget.id == 'malik') {
      range1 = '1-226';
      range2 = '227-452';
      range3 = '453-678';
      range4 = '679-904';
      range5 = '905-1130';
      range6 = '1131-1356';
      range7 = '1357-1587';
    }
    if (widget.id == 'muslim') {
      range1 = '1-705';
      range2 = '706-1411';
      range3 = '1412-2117';
      range4 = '2118-2823';
      range5 = '2824-3529';
      range6 = '3530-4235';
      range7 = '4236-4930';
    }
    if (widget.id == 'nasai') {
      range1 = '1-766';
      range2 = '767-1532';
      range3 = '1533-2298';
      range4 = '2299-3064';
      range5 = '3065-3829';
      range6 = '3830-4595';
      range7 = '4596-5364';
    }
    if (widget.id == 'tirmidzi') {
      range1 = '1-518';
      range2 = '519-1036';
      range3 = '1037-1554';
      range4 = '1555-2072';
      range5 = '2073-2589';
      range6 = '2590-3107';
      range7 = '3108-3625';
    }
    setState(() {});
  }

  getData() async {
    rangeSatu = await repository.getData('${widget.id}?range=$range1');
    rangeDua = await repository.getData('${widget.id}?range=$range2');
    rangeTiga = await repository.getData('${widget.id}?range=$range3');
    rangeEmpat = await repository.getData('${widget.id}?range=$range4');
    rangeLima = await repository.getData('${widget.id}?range=$range5');
    rangeEnam = await repository.getData('${widget.id}?range=$range6');
    rangeTujuh = await repository.getData('${widget.id}?range=$range7');
    listHadiths = [
      ...rangeSatu,
      ...rangeDua,
      ...rangeTiga,
      ...rangeEmpat,
      ...rangeLima,
      ...rangeEnam,
      ...rangeTujuh
    ];
    setState(() {});
  }

  @override
  void initState() {
    getRange();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 133, 22),
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 26, 109, 29),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: HadithSearchDelegate(listHadiths, widget.name),
              );
            },
          ),
        ],
      ),
      body: listHadiths.isEmpty
          ? Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/img/bg.png"),
                fit: BoxFit.cover,
              )),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 233, 154, 35),
                ),
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/img/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 26, 109, 29),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Center(
                          child: Text(
                            listHadiths[index].number.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        '${listHadiths[index].id} ${listHadiths[index].number}',
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        listHadiths[index].arab,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => itemViewPage(
                                id: listHadiths[index].id,
                                name: widget.name,
                                arab: listHadiths[index].arab,
                                number: listHadiths[index].number.toString()),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: listHadiths.length,
              ),
            ),
    );
  }
}

class HadithSearchDelegate extends SearchDelegate<String> {
  final List<Hadith> listHadiths;
  final String name;

  HadithSearchDelegate(this.listHadiths, this.name);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context, name);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context, name);
  }

  Widget _buildSearchResults(BuildContext context, name) {
    final List<Widget> results = [];
    final String lowercaseQuery = query.toLowerCase();

    for (final Hadith hadith in listHadiths) {
      if (hadith.id.toLowerCase().contains(lowercaseQuery) ||
          hadith.number.toString().contains(lowercaseQuery)) {
        results.add(Card(
          child: ListTile(
            leading: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 109, 29),
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Center(
                child: Text(
                  hadith.number.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            title: Text(
              '${hadith.id} ${hadith.number}',
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              hadith.arab,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              // Handle tap on the search result
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => itemViewPage(
                        name: name,
                        id: hadith.id,
                        arab: hadith.arab,
                        number: hadith.number.toString())),
              );
            },
          ),
        ));
      }
    }

    return ListView(
      children: results,
    );
  }
}
