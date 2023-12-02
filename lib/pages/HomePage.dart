import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mangafikri/pages/DetailPage.dart';
import 'package:mangafikri/pages/FavoritePage.dart';
import 'package:mangafikri/pages/ProfilePage.dart';
import 'package:mangafikri/widget/Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<CustomCard> allCards = [
    CustomCard(
      title: 'One Piece',
      img: 'assets/images/pic1.jpg',
      genre: 'Action,Comedy',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'Jujutsu Kaisen',
      img: 'assets/images/pic2.jpg',
      genre: 'Action,Comedy',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'Dr.Stone',
      img: 'assets/images/pic3.jpg',
      genre: 'Sains, Action',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'Edens Zero',
      img: 'assets/images/pic4.jpg',
      genre: 'Action,Comedy',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'ChainsawMan',
      img: 'assets/images/pic5.jpg',
      genre: 'Action,Horor',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'Black Clover',
      img: 'assets/images/pic6.png',
      genre: 'Action,Comedy',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'One Punch Man',
      img: 'assets/images/pic7.jpg',
      genre: 'Action,Superhero',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'My Hero Academia',
      img: 'assets/images/pic8.png',
      genre: 'Superhero,Action',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'DragonBall',
      img: 'assets/images/pic9.png',
      genre: 'Action,Comedy',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
    CustomCard(
      title: 'Boruto',
      img: 'assets/images/pic10.png',
      genre: 'Action,Ninja',
      isFavorite: false,
      onFavoriteChanged: (isFavorite) {},
    ),
  ];

  List<CustomCard> filteredCards = [];

  bool isSearchBarVisible = false;

  List<CustomCard> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    filteredCards = allCards;
  }

  void filterCards(String query) {
    setState(() {
      filteredCards = allCards
          .where(
              (card) => card.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    void iconFavorite(CustomCard card) {
      setState(() {
        card.isFavorite = !card.isFavorite;

        if (card.isFavorite) {
          favoriteItems.add(card);
        } else {
          favoriteItems.remove(card);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, Fikri',
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchBarVisible = !isSearchBarVisible;
              });
            },
            icon: Icon(Icons.search),
            color: Colors.black,
            iconSize: 36,
          )
        ],
        bottom: isSearchBarVisible
            ? PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: searchController,
                    onChanged: filterCards,
                    decoration: InputDecoration(
                      hintText: 'Cari...',
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('One Piece',
                              style: GoogleFonts.robotoSerif(
                                textStyle: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w600),
                              )),
                          Text('New Chapter',
                              style: GoogleFonts.robotoSerif(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                ),
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text(
                                'Read More',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: screenWidth * 0.2,
                          height: 130,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/images/luffy.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  'New Update',
                  style: GoogleFonts.roboto(
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: filteredCards
                      .map(
                        (card) => CustomCard(
                          title: card.title,
                          img: card.img,
                          genre: card.genre,
                          isFavorite: card.isFavorite,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(),
                              ),
                            );
                          },
                          onFavoriteChanged: (isFavorite) {
                            handleFavoriteChange(card, isFavorite);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'Top Popular',
              style: GoogleFonts.roboto(
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: filteredCards
                .map(
                  (card) => CustomCard(
                    title: card.title,
                    img: card.img,
                    genre: card.genre,
                    isFavorite: card.isFavorite,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(),
                        ),
                      );
                    },
                    onFavoriteChanged: (isFavorite) {
                      handleFavoriteChange(card, isFavorite);
                    },
                  ),
                )
                .toList(),
          )
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavPage(favoriteItems),
              ),
            );
          } else if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  void handleFavoriteChange(CustomCard card, bool isFavorite) {
    setState(() {
      card.isFavorite = isFavorite;

      if (isFavorite) {
        favoriteItems.add(card);
      } else {
        favoriteItems.remove(card);
      }
    });
  }
}
