import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_cost/domain/model/on_boarding_model.dart';
import 'package:save_cost/presentation/ui/authentication/login_screen.dart';
class OnBoardingScreen extends StatefulWidget

{
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image:'assets/images/onboard .jpg',
      title:'onboard 1 _Shopping',
      body:'explore many products',
    ),
    BoardingModel(
      image:'assets/images/choose best price.jpg',
      title:'onboard 2_Shopping',
      body:'choose the best price',
    ),
    BoardingModel(
      image:'assets/images/car share .jpg',
      title:'onboard 1 _Sharing trip',
      body:'Share your trip with others',
    ),
    BoardingModel(
      image:'assets/images/connect with others.jpg',
      title:'onboard 2_Sharing trip',
      body:'connect with others and make new experience',
    ),
    BoardingModel(
      image:'assets/images/save your money.jpg',
      title:'onboard 3',
      body:'Save your money',
    ),
    BoardingModel(
      image:'assets/images/client reviews.png',
      title:'onboard 4',
      body:'see client Reviews',
    ),
  ];

  bool islast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          TextButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder:(builder)=>LoginScreen()),);

          }, child:Text('SKIP'),)
        ],
      ) ,
      body:
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [

            Expanded(
              child: PageView.builder(
                physics:BouncingScrollPhysics() ,
                controller: boardController,
                onPageChanged: (int index){
                  if(index== boarding.length-1)
                  {
                    islast=true;
                  }
                  else{
                    islast=false;
                  }
                },

                itemBuilder: (context, index)=>buildBoardingItem (boarding[index]),
                itemCount: boarding.length,

              ),
            ),
            SizedBox(height: 40.0,),



            // Row(children: [
            //   // SmoothPageIndicator(
            //   //   effect: ExpandingDotsEffect(
            //   //
            //   //     dotColor: Colors.grey,
            //   //     dotHeight: 10,
            //   //     expansionFactor: 6,
            //   //     dotWidth: 10,
            //   //     spacing: 5.0,
            //   //   ),
            //
            //     controller: boardController,
            //     count: boarding.length,
            //   ),

              FloatingActionButton(
                onPressed: ()
                {
                  if(islast){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder:(context)=>LoginScreen() ,
                      ),
                          (route)
                      {
                        return false;
                      },
                    );
                  }
                  boardController.nextPage(
                      duration: Duration(milliseconds: 750,),
                      curve: Curves.fastLinearToSlowEaseIn,);


                },
                child:Icon(Icons.arrow_forward_ios),

              ),
            ],),

          // ],
        ),
      // ),



    );

  }

  Widget buildBoardingItem (BoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child:
        Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text(
        '${model.title}',
        style:TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,

        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style:TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,

        ),
      ),

    ],
  );
}
