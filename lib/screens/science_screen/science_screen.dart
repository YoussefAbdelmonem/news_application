import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/controller.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/component.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsController,NewsStates>(
      listener: (context ,state){},
      builder: (context ,state){

        var article = NewsController.get(context).science;
        return ConditionalBuilder(


          condition: state is! NewsGetBusinessLoadingStateState,


          builder:(context)=> ListView.separated(
              itemBuilder: (context , index) =>buildArticle(article [ index],context),
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context , index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.grey,
                  height: 1.0,
                  width: double.infinity,

                ),
              ),
              itemCount: 15
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),
        );
      },

    );
  }
}
