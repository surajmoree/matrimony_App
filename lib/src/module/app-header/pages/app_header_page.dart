import 'package:flutter/material.dart';

class AppHeaderPage extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color? color;
  const AppHeaderPage({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: GestureDetector(
        onTap: () {},
        child: const Icon(Icons.menu),
      ),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 26.0,
              ),
            )),
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.more_vert),
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
