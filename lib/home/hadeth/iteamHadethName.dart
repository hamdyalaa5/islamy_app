import 'package:flutter/material.dart';
import 'Hadeath_details_screen.dart';
import 'hadeth.dart';
class IteamHadethName extends StatelessWidget {
  Hadeath hadeath;

  IteamHadethName({required this.hadeath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadeathDetials.routeName, arguments: hadeath);
      },
      child: Text(
        hadeath.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
