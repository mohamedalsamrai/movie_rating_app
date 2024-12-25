import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_rating_app/domain/models/cast_model.dart';
import 'package:movie_rating_app/utils/constants.dart';
import 'package:movie_rating_app/utils/utilities.dart';

class CastList extends StatelessWidget {
  const CastList({
    super.key,
    required this.castList,
  });

  final List<CastModel> castList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                    color: Constants.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(50), top: Radius.circular(50)),
                    child: CachedNetworkImage(
                      imageUrl: getImageUrl1280(castList[index].imagePath),
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                castList[index].name,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 8,
                    color: Color(0xffffffff)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
