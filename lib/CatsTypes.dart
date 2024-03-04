import 'package:flutter/material.dart';

import 'Cat1.dart';
import 'CatModel.dart';
import 'Favorite_Screen.dart';

class CatsTypes extends StatefulWidget {
  CatsTypes({super.key});

  var height, width;
  @override
  State<CatsTypes> createState() => _CatsTypesState();
}

class _CatsTypesState extends State<CatsTypes> {

  @override
  Widget build(BuildContext context) {


    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xff3559E0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff3559E0),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25,
                      left: 20,
                      right: 20,
                      bottom: 10
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Types Of Cats',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 35,
                              fontFamily: 'Kalam',
                              color: Colors.white
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),


          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              //  height: height
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 20,
                  ),
                  physics: BouncingScrollPhysics(),
                  itemCount: catList.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Cat1(index)));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 0,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              child: Hero(
                                tag: catList[index].catName,
                                child: Image(image: AssetImage(catList[index].imgPath,),
                                  width: 100,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                catList[index].catName,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Kalam",
                                    color: Colors.green,
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ),
                          ],

                        ),
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

