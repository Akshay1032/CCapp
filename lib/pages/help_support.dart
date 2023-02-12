import 'package:flutter/material.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        body:Container(
          alignment: Alignment.centerLeft,
          color: Colors.black,
          child:Column(
            children: [
              const SizedBox(height:20),
              Container(
                height:200,
                width:500,
                color:const Color.fromRGBO(63, 68, 82, 1),
                padding: const EdgeInsets.all(30.0),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Hi  ",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Oswald",
                            color: Colors.white,
                          ),
                        ),
                        Icon(Icons.handshake, size: 30,color:Colors.white),

                      ],

                    ),
                    //const SizedBox(height: 10,),

                    const Text("How can we help you?",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Oswald",
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("Our team's contact details are given below",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Oswald",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Text("EFA contact details",
                        style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Oswald",
                        color: Colors.white,
                        ),
                      ),
                      const SizedBox(height:10),
                      Row(
                        children: const [
                           Text("Email:   ",
                            style: TextStyle(
                              color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Oswald"
                            ),
                           ),
                             Text("efa@pilani.bits-pilani.ac.in",
                               style: TextStyle(
                                   color: Colors.blueAccent,
                                   fontSize: 18,
                                   fontWeight: FontWeight.w500,
                                   fontFamily: "Oswald"
                               ),
                             ),
                        ],
                      ),
                      const SizedBox(height:10),
                      Row(
                        children: const [
                          Text("Phone No:   ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Oswald"
                            ),
                          ),
                          Text("9351227568",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Oswald"
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height:10),
                      const Divider(color: Colors.white),
                      const SizedBox(height:10),
                      const Text("Coding Club contact details",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Oswald",
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height:10),
                      Row(
                        children: const [
                          Text("Email:   ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Oswald"
                            ),
                          ),
                          Text("cc@pilani.bits-pilani.ac.in",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Oswald"
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height:10),
                      Row(
                        children: const [
                          Text("Phone No:   ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Oswald"
                            ),
                          ),
                          Text("9351227568",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Oswald"
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height:10),
                      const Divider(color: Colors.white),
                      const SizedBox(height:10),

                      const Text("For Queries,fill the form:   ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Oswald"
                        ),
                      ),
                      const Text("https://akdbckcakjkjlsdlf.com",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Oswald"
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Help & Support",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  fontFamily: "Oswald"
              )),
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
    );
  }
}
