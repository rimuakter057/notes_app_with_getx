import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){}, icon:Icon(Icons.menu)),
        Row(
          children: [
            IconButton(onPressed: (){}, icon:Icon(Icons.search)),
            IconButton(onPressed: (){}, icon:Icon(Icons.more_vert)),
          ],
        ),
      ],
    );
  }
}