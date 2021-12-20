import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
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
      title: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 8.0,
        borderOnForeground: true,
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/wishlist");
            },
            icon: const Icon(Icons.favorite))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45.0);
}
