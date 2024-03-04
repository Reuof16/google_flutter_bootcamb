import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'CatsTypes.dart';
import 'Favorite_Screen.dart';
import 'Profile.dart';

class HomeLayout extends StatefulWidget {


  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  List<Widget> screens=
  [
    ProfileScreen(),
    CatsTypes(),
    FavoriteScreen(),
  ];
  int currentIndex=1;
  List<String> titles=
  [
    'Profile',
    'Home',
    'Favorites Cats',
  ];
  var keyScaff=GlobalKey<ScaffoldState>();
  var keyForm=GlobalKey<FormState>();
  var nameController=TextEditingController();
  var originController=TextEditingController();
  var lengthController=TextEditingController();
  var minWeightController=TextEditingController();
  var maxWeightController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaff,
      appBar: AppBar(
        backgroundColor:  Color(0xff3559E0),
        centerTitle: true,
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            fontFamily: 'Kalam',
            fontSize: 22,
          ),
        ),
        actions:
        [
          if(currentIndex == 1)
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: IconButton(
                  onPressed: ()
                  {
                    setState(() {
                      currentIndex=2;
                    });
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  )),
            ),
        ],
      ),
      body: screens[currentIndex],
      floatingActionButton: currentIndex == 0? FloatingActionButton(
        onPressed: ()
        {

          keyScaff.currentState?.showBottomSheet(
                  (context) => SingleChildScrollView(
                child: Container(

                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: keyForm,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:
                        [
                          Text(
                            'Add New Cat',
                            style: TextStyle(
                              fontFamily: 'Kalam',
                              fontSize: 18,
                            ),
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              label: Text(
                                'Name',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: originController,
                            decoration: InputDecoration(
                              label: Text(
                                'Origin',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: lengthController,
                            decoration: InputDecoration(
                              label: Text(
                                'Length',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: minWeightController,
                            decoration: InputDecoration(
                              label: Text(
                                'minWeight',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: maxWeightController,
                            decoration: InputDecoration(
                              label: Text(
                                'maxWeight',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: (){},
                              child: Text(
                                'Save',
                              )),


                        ],
                      ),
                    ),
                  ),
                ),
              )).closed.then((value)
          {

          });
        },
        child: Icon(
          Icons.add,
        ),
      ):null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index)
        {
          setState(() {
            currentIndex=index;
          });
        },
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
      ),
    );

  }
}
