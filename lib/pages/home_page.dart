

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _selectedIndex=index;
          });
        },
        children: [
          Container(
              color: Colors.green,
            child: Center(
              child: Text('Home'),
            ),
          ),
          Container(
            color: Colors.white,
            child: ListView(
              children: [
                _itemList(name: 'Bahrom', time: '20:18', image: 'assets/images/im_profile.png', message: "How about message" ),
                _itemList(name: 'Jonibek', time: '18:25', image: 'assets/images/im_profile.png', message: "I love that it's great!" ),
                _itemList(name: 'Rasul', time: '19:45', image: 'assets/images/im_profile.png', message: "I wasn't aware of that. Let me check" ),
                _itemList(name: 'Oybek', time: '17:25', image: 'assets/images/im_profile.png', message: "Flutter just realse 1.0 offically. Should I go for it?" ),
                _itemList(name: 'Islom', time: '14:12', image: 'assets/images/im_profile.png', message: "It totally makes sense to get some extra day of." ),
                _itemList(name: 'Javohir', time: '12:00', image: 'assets/images/im_profile.png', message: "It has been re-chelduled to next Sturday 7.30" ),
              ],
            ),
          ),
          
          Container(
            color: Colors.red,
            child: Center(
              child: Text('Video'),
            ),
          ),
          Container(
            color: Colors.pink,
            child: Center(
              child: Text('Notification'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                height: 200,
                color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/im_profile.png', ),
                    ),
                    Text('Bahrom',style: TextStyle(color: Colors.white),),
                    Text('bahrom@gmail.com',style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 20,),
                    Text('Home')
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 20,),
                    Text('Profile')
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 20,),
                    Text('Aboutus')
                  ],
                ),
              ),
            ],
          ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index){
          setState(() {
            _selectedIndex = index;
            _pageController!.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        },
      ),

    );
  }
        Widget _itemList({name, image, message, time}){
          return Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Image(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                Expanded(child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(name),
                          SizedBox(width: 30,),
                          Text(time),
                        ],
                      ),
                      Text(message),
                    ],
                  ),
                )),
                Icon(Icons.navigate_next),
              ],
            ),
          );

        }

}
