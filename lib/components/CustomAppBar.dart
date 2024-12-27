// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:khaliq_bus/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
        bottom: BorderSide(color: gray),
      ),
      centerTitle: true,
      title:  Text(title, style: AppBarTextStyle,),
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu, color: darkblue,),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}