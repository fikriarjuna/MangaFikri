import 'package:flutter/material.dart';
import 'package:mangafikri/widget/Card.dart';
import 'package:google_fonts/google_fonts.dart';

class FavPage extends StatelessWidget {
  final List<CustomCard> favoriteItems;

  FavPage(this.favoriteItems);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Page',
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back, 
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteItems[index].title),
            subtitle: Text(favoriteItems[index].genre),
            leading: Image.asset(
              favoriteItems[index].img,
            ),
          );
        },
      ),
    );
  }
}
