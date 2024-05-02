import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../My_theme.dart';

import '../../providers/settings_provider.dart';

class IteamHadeathDetalis extends StatelessWidget {
  String content;

  IteamHadeathDetalis({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Text(
      content,
      textAlign: TextAlign.center,
      style: provider.isDarkMode()
          ? Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: MyTheme.yellow)
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
