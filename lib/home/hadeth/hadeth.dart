import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_provider.dart';
import 'iteamHadethName.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  List<Hadeath> ahdeath = [];

  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    if (ahdeath.isEmpty) {
      loadFile();
    }
    return Column(
      children: [
        Center(
          child: Image(image: AssetImage("assets/images/hadeth_header_image.png")),
        ),
        Divider(
          color: provider.isDarkMode() ? MyTheme.yellow : MyTheme.lightPrimareyColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: provider.isDarkMode() ? MyTheme.yellow : MyTheme.lightPrimareyColor,
          thickness: 3,
        ),
        ahdeath.isEmpty
            ? CircularProgressIndicator(
          color: MyTheme.lightPrimareyColor,
        )
            : Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return IteamHadethName(
                  hadeath: ahdeath[index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                        color: provider.isDarkMode()
                            ? MyTheme.yellow
                            : MyTheme.lightPrimareyColor,
                        thickness: 2,
                      );
              },
              itemCount: ahdeath.length),
        )
      ],
    );
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = hadethContent.split("#\r\n");
    for (int i = 0; i < hadethList.length; i++) {
      List<String> lines = hadethList[i].split("\n");
      String title = lines[0];
      lines.removeAt(0);
      Hadeath headth = Hadeath(content: lines, title: title);
      ahdeath.add(headth);
      setState(() {});
    }
  }
}

class Hadeath {
  String title;
  List<String> content;

  Hadeath({required this.content, required this.title});
}
