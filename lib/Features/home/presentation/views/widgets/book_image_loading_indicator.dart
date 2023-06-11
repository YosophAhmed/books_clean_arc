import 'package:flutter/material.dart';

class BookImageLoadingIndicator extends StatelessWidget {
  const BookImageLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Colors.grey.withOpacity(
            0.3,
          ),
        ),
      ),
    );
  }
}
