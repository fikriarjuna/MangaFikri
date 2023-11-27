import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  CustomCard({
    Key? key,
    required this.title,
    required this.img,
    required this.genre,
    this.onTap,
    required this.isFavorite,
    required this.onFavoriteChanged,
  }) : super(key: key);

  final String title;
  final String img;
  final String genre;
  final VoidCallback? onTap;
  bool isFavorite;
  final Function(bool) onFavoriteChanged;
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 16),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isFavorite = !widget.isFavorite;
                    });
                    widget.onFavoriteChanged(widget.isFavorite);
                    final snackBar = SnackBar(
                      content: Text(
                        widget.isFavorite
                            ? 'Berhasil ditambahkan ke favorit'
                            : 'Dihapus dari favorit',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.genre,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
