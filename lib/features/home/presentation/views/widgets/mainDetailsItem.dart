import 'dart:ui';

import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDetailesItem extends StatelessWidget {
  const MainDetailesItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          SizedBox(
            height: 260,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                  aspectRatio: 2.9 / 4,
                  child: CachedNetworkImage(
                    imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            bookModel.volumeInfo!.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
          Text(
            bookModel.volumeInfo!.authors![0],
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amberAccent,
                  size: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  '${bookModel.volumeInfo?.averageRating ?? 0}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Text('(${bookModel.volumeInfo?.ratingsCount ?? 0})',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ],
      );
    });
  }
}
