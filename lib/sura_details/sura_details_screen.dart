import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/sura_details/sura_details_arguments.dart';
import 'package:islamy_app/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routName = 'sura details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    SuraDetailsScreenArguments args = ModalRoute.of(context)?.settings.arguments
        as SuraDetailsScreenArguments;
    // print(args.name);
    // print(args.index);
    // read file then return widget
    //block build
    if (verses.isEmpty) readFile(args.index + 1);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(settingsProvider.getMainBackgroundImage()),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
          appBar: AppBar(
            title: Text(

              args.name,
            ),
          ),
          body: verses.isEmpty
              ? //still reading file
              Center(
                  child: CircularProgressIndicator(),
                )
              : Card(

                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 64),
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      return VerseWidget(verses[index], index + 1);
                    },
                    itemCount: verses.length,
                    separatorBuilder: (_, __) {
                      return Container(
                        color: Theme.of(context).accentColor,
                        height: 1,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 64),
                      );
                    },
                  ),
                )),
    );
  }

  void readFile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/files/$fileIndex.txt');
    List<String> lines = fileContent.trim().split('\n');
    //show in list view
    //rebuild
    setState(() {
      verses = lines;
    });
  }
}
