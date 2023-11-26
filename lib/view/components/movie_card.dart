import 'package:flutter/material.dart';
import 'package:movie_app/view/components/favorite_icon.dart';
import 'package:movie_app/widgets/text.dart';

class MovieCardWidget extends StatelessWidget {
  final int id;
  final String posterUrl;
  final String title;
  final String releaseDate;
  final String overview;
  const MovieCardWidget(
      {super.key,
      required this.id,
      required this.posterUrl,
      required this.title,
      required this.releaseDate,
      required this.overview});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 250,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff292b37),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff292b37),
                            spreadRadius: 2,
                            blurRadius: 6,
                          )
                        ],
                      ),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Image.network(
                            posterUrl,
                            height: 250,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                              child: FavoriteIcon(
                            movieId: id,
                          )),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          modified_text(
                            text: title,
                            size: 18,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.amber,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              modified_text(
                                text: releaseDate,
                                size: 12,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            overview,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
