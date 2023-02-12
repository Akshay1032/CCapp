import 'package:flutter/material.dart';
import 'package:cc_task_final/pages/add_card.dart';
import 'package:cc_task_final/user_set.dart';
import 'package:cc_task_final/support_func.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  int _currentIndex = 0;
  int _selectedButton = 0;

  Widget cardTemplate(thisUser) {
    return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        color: Colors.grey,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                width:150,
                alignment: Alignment.center,
                child: Text(
                  thisUser.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 05),
              Text(
                thisUser.designation,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w200,

                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: 100,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      style: BorderStyle.solid
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        deleteCard(name: thisUser.name);
                      });
                    },
                    icon: const Icon(Icons.facebook, size: 30),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        deleteCard(name: thisUser.name);
                      });
                    },
                    icon: const Icon(Icons.mail, size: 30),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex = 0;

    return InternetWidget(
        offline: EmptyWidget(
          image: null,
          packageImage: PackageImage.Image_4,
          title: 'No Internet Connection',
          subTitle: 'Connect to the internet to continue',
          titleTextStyle: const TextStyle(
            fontSize: 22,
            color: Color(0xff9da9c7),
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xffabb8d6),
          ),
        ),
        online: Container(
          color: Colors.black,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  color: const Color.fromRGBO(63, 68, 82, 1),
                  child: Container(
                    width: 370,
                    height: 50,
                    margin: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                        SizedBox(
                          width:90,
                          child: Card(shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                            color: _selectedButton == 0 ? Colors.blueAccent: const Color.fromRGBO(63, 68, 82, 1),
                            child: IconButton(
                              icon:  const Text("</>",
                                    style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Oswald",
                                    color: Colors.white,
                                  ),),
                              onPressed: () {
                                setState(() {
                                  _selectedButton = 0;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width:90,
                          child: Card(shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                            color: _selectedButton == 1 ? Colors.blueAccent: const Color.fromRGBO(63, 68, 82, 1),
                            child: IconButton(
                              icon:  const Text("UX",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Oswald",
                                  color: Colors.white,
                                ),),
                              onPressed: () {
                                setState(() {
                                  _selectedButton = 1;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width:90,
                          child: Card(shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                            color: _selectedButton == 2 ? Colors.blueAccent: const Color.fromRGBO(63, 68, 82, 1),
                            child: IconButton(
                              icon: const Icon(Icons.sports_basketball, size: 30, color:Colors.white),
                              onPressed: () {
                                setState(() {
                                  _selectedButton = 2;
                                });
                              },
                            ),
                          ),
                        ),
                        // Icon(Icons.circle_notifications, size: 40,color:Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height:5),
                StreamBuilder<List<UserSet>>(
                    stream: readCards(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final cards = snapshot.data!;
                        if (cards.length < 1) {
                          return EmptyWidget(
                            image: null,
                            packageImage: PackageImage.Image_3,
                            title: 'No Users',
                            subTitle: 'No user have been added',
                            titleTextStyle: const TextStyle(
                              fontSize: 22,
                              color: Color(0xff9da9c7),
                              fontWeight: FontWeight.w100,
                            ),
                            subtitleTextStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xffabb8d6),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 480,
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: cards
                                  .map((thisUser) => cardTemplate(thisUser))
                                  .toList(),
                            ),
                          );
                        }
                      } else {
                        //return const Center(child: CircularProgressIndicator());
                        return EmptyWidget(
                          image: null,
                          packageImage: PackageImage.Image_3,
                          title: 'No Users',
                          subTitle: 'No users have been added',
                          titleTextStyle: const TextStyle(
                            fontSize: 22,
                            color: Color(0xff9da9c7),
                            fontWeight: FontWeight.w100,
                          ),
                          subtitleTextStyle: const TextStyle(
                            fontSize: 14,
                            color: Color(0xffabb8d6),
                          ),
                        );
                      }
                    }),
              ],
            ),
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Text("About Us",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w200,
                    fontFamily: "Oswald"
                  )),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddCard()),
                ).then((value) => setState(() {}));
              },
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedLabelStyle: const TextStyle(color: Colors.white),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card,color: Colors.white),
                  label: 'Cards',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.card_giftcard,color: Colors.white,),
                  label: 'Practice',
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                if (index == 1) {
                  Navigator.pushNamed(context, '/help');
                }
              },
              selectedItemColor: Colors.amber[800],
            ),
          ),
        ));
  }
}
