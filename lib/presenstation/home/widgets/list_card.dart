// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/response/question_response_model.dart';
import '../../detail/pages/detail_page.dart';

class ListCard extends StatefulWidget {
  final Datum datums;

  const ListCard({
    super.key,
    required this.datums,
  });

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  // final localDataSource = RestaurantLocalDatasource.instance;
  bool isFavorite = false;

  // Future<void> checkFavoriteStatus() async {
  //   if (mounted) {
  //     final favoriteStatus = await RestaurantLocalDatasource.instance
  //         .isRestaurantFavorite(widget.restaurants.id);

  //     if (mounted) {
  //       setState(() {
  //         isFavorite = favoriteStatus;
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    // checkFavoriteStatus();
    super.initState();
  }

  @override
  void dispose() {
    // checkFavoriteStatus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(id: widget.datums.idSchedule),
            ),
          );
        },
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 11, 21, 10),
                      child: Text(
                        "27-01-2024",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 100, 10),
                      child: Text(
                        widget.datums.titelQuestion,

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        // softWrap: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 0, 100, 10),
                      child: Text(
                        widget.datums.tujuanQuestion,

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        // softWrap: false,
                      ),
                    ),
                    // Text(
                    //   " widget.restaurants.rating.toString()",
                    // )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 120,
                  width: 30,
                  child: SvgPicture.asset(
                    "assets/icons/ph_chalkboard-teacher.svg",
                    height: 76,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
