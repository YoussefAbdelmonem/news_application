import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/controller.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/screens/search/search_screen.dart';
import 'package:news_app/shared/component.dart';

class News_layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)
    =>NewsController()..getBusiness()..getSport()..getScience(),
        child: BlocConsumer<NewsController , NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = NewsController.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Daily Feeds'),
              actions: [

                IconButton(onPressed: ()
                {
                  navigateTo(context, SearchScreen(),);
                },
                    icon: const Icon(
                      Icons.search,
                    ))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],

            bottomNavigationBar: BottomNavigationBar(
              items:cubit.bottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavigation(index);
              },


            ),

          );
    },
    ),
    );
  }
}
