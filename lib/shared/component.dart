import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/web_view_screen/web_view.dart';

Widget buildArticle(article,context) => InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));

  },
  child:   Padding(

    padding:  EdgeInsets.all(10.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                image: NetworkImage(

                  '${article['urlToImage']}'



                ),

                fit: BoxFit.cover,



              )

          ),

        ),

        SizedBox(width: 10,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisSize: MainAxisSize.min,



              children:  [

                Text(

                  '${article['title']}',

                  style: TextStyle(

                    fontSize: 14,

                    fontWeight: FontWeight.w700,



                  ),

                  maxLines: 4,

                  overflow: TextOverflow.ellipsis,



                ),

                Spacer(),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    fontSize: 14,

                    fontWeight: FontWeight.w700,

                    color: Colors.grey,





                  ),

                ),

              ],

            ),

          ),

        )

      ],

    ),

  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),


);

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClickable,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null
        ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(
        suffix,
      ),
    )
        : null,
    border: OutlineInputBorder(),
  ),
);