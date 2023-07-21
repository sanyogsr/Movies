import 'package:flutter/material.dart';
import 'package:movies/config/global/widgets/movie_list_item.dart';

class MovieList extends StatelessWidget {
  final int itemCount;
  final String movieCategory;
  const MovieList({
    Key? key,
    required this.itemCount,
    required this.movieCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => MovieListItem(
                itemIndex: index,
                itemCount: itemCount,
                movieCategory: movieCategory,
                needSpacing: true)),
      ),
    );
  }
}
