import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/wishlist');
          },
          icon: const Icon(
            Icons.favorite,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signout');
          },
          icon: const Icon(
            Icons.logout_rounded,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  // determines the height of appbar. It will be 50.0
  Size get preferredSize => const Size.fromHeight(50.0);
}
