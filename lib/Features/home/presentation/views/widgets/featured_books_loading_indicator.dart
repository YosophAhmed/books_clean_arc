import 'package:bookly/Features/home/presentation/views/widgets/book_image_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedBooksLoadingIndicator extends StatelessWidget {
  const FeaturedBooksLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: BookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
