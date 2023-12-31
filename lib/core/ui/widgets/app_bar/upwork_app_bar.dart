import 'package:flutter/material.dart';

class UpworkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpworkAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: title != null
          ? Text(
              title!.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      elevation: 0,
      centerTitle: true,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
