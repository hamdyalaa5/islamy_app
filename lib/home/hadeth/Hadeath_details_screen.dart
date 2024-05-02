import 'package:flutter/material.dart';
import 'package:islamy_app/My_theme.dart';
import 'package:provider/provider.dart';
import '../../providers/settings_provider.dart';
import 'hadeth.dart';
import 'iteamHadeathDetails.dart';

class HadeathDetials extends StatefulWidget {
  static String routeName = "Hadeath_detials";

  @override
  State<HadeathDetials> createState() => _HadeathDetialsState();
}

class _HadeathDetialsState extends State<HadeathDetials> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as Hadeath;
    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              "assets/images/backgrounddark.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              "assets/images/main_background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "${args.title}",
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: MyTheme.yellow)
                : Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * .03,
            vertical: MediaQuery.of(context).size.width * .15,
          ),
          decoration: BoxDecoration(
              color:
                  provider.isDarkMode() ? MyTheme.darkPrimareyColor : MyTheme.yellow,
              borderRadius: BorderRadius.circular(25)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return IteamHadeathDetalis(
                content: args.content[index],
              );
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}
