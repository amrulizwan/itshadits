import 'package:flutter/material.dart';
import 'package:itshadits/model/book_model.dart';
import 'package:itshadits/repo/repository.dart';
import 'package:itshadits/view/about.dart';
import 'package:itshadits/view/hadith_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Book> listBooks = [];
  Repository repository = Repository();

  getData() async {
    listBooks = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch =
        Uri(scheme: 'https', host: 'amrulizwan.my.id', path: '/');
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/bg.png"),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Image.asset(
                    "assets/img/bismillah.png",
                    width: 220.0,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 22.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HadithViewPage(
                                  id: listBooks[index].id,
                                  name: listBooks[index].name,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.15),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                border: Border.all(
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  listBooks[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: listBooks.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () async {
            //navpush
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AboutDeveloperPage();
            }));
          },
          child: const Icon(
            Icons.help_outline,
            size: 32,
          ),
        ));
  }
}
