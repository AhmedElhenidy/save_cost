import 'package:flutter/material.dart';
import 'package:save_cost/sharing_cost_screens/profile/editing_profile_page.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final bool isEdit;
  const ProfileWidget ({

    Key ? key,
    required this.imagePath,
    required this.onClicked,
    this.isEdit=false,


}):super (key : key);

  @override
  Widget build(BuildContext context) {
    final color = Theme
        .of(context)
        .colorScheme
        .primary;

    return Center(
      child: Stack(
          children:[
            buildImage(),
            Positioned(
              bottom: 0,
                right: 4,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder:(builder)=> EditingProfilePage())
                        );
                  },
                    child: buildEditingIcon(color))
            ),
          ],
      ),
    );
  }
    Widget buildImage(){
      final image = NetworkImage(imagePath);
      return ClipOval
        (
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image:image ,
            fit: BoxFit.cover,
            width: 150,
            height: 150,
            child: InkWell(onTap: onClicked,),

          ),
        ),
      );


    }

  Widget buildEditingIcon(Color color) => buildCircle(
    all: 3.0,
    color: Colors.white,
    child: buildCircle(
      color: color,
      all:8.0,
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
    ),
  );
}

Widget buildCircle({
  required Color color
  , required double all,
  required Widget child
}) => ClipOval(
  child: Container(
  
    padding: EdgeInsets.all(all),
  
    color: color,
   child:child ,
  
  ),
);
