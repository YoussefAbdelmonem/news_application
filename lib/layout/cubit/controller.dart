import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/screens/busness_screen/bussiness_screen.dart';
import 'package:news_app/screens/general_screen/general_screen.dart';
import 'package:news_app/screens/science_screen/science_screen.dart';
import 'package:news_app/screens/sport_screen/sport_screen.dart';
import 'package:news_app/shared/network/dio_helper.dart';

class NewsController extends Cubit<NewsStates>
{
  NewsController() : super(NewsInitialState());

  static NewsController get (context)=>BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItems =
  [
  //   const BottomNavigationBarItem(
  //              icon:Icon(
  //        Icons.article,
  //     ),
  // label: 'general' ),
    const BottomNavigationBarItem(
               icon:Icon(
         Icons.business_sharp,
      ),
  label: 'business' ),
    const BottomNavigationBarItem(
               icon:Icon(
         Icons.science,
      ),
  label: 'science' ),
    const BottomNavigationBarItem(
               icon:Icon(
         Icons.sports,
      ),
  label: 'sport' ),
  ];
  int currentIndex=0;
  void changeBottomNavigation (int index)
  {
   currentIndex=index;
   emit(NewsBottomNavigationState());
  }
  List<Widget> screens =
  [

    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),

  ];
  // List<dynamic> general =[];
  //
  // void getGeneral()
  // {
  //   emit(NewsGetGeneralLoadingStateState());
  //   DioHelper.getData(
  //       url: 'v2/everything',
  //       query: {
  //         'domains':'wsj.com',
  //         'apiKey':'5b25131ca38447a5b5225947f229aa12',
  //       }).then((value)
  //   {
  //     general = value.data['article'];
  //     emit(NewsGetGeneralSuccessStateState());
  //   }).
  //   catchError((error)
  //   {
  //     emit(NewsGetGeneralErrorStateState(error.toString()),
  //
  //
  //
  //     );
  //
  //   });
  // }

  List<dynamic> business =[];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingStateState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'5b25131ca38447a5b5225947f229aa12',
        }).then((value)
    {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessStateState());
    }).
    catchError((error)
    {
      emit(NewsGetBusinessErrorStateState(error.toString()),



      );

    });
  }

  List<dynamic> sport =[];

  void getSport()
  {
    emit(NewsGetSportLoadingStateState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'sport',
          'apiKey':'5b25131ca38447a5b5225947f229aa12',
        }).then((value)
    {
      sport = value.data['articles'];
      emit(NewsGetSportSuccessStateState());
    }).
    catchError((error)
    {
      emit(NewsGetSportErrorStateState(error.toString()),



      );

    });
  }
  List<dynamic> science =[];

  void getScience()
  {
    emit(NewsGetScienceLoadingStateState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'5b25131ca38447a5b5225947f229aa12',
        }).then((value)
    {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessStateState());
    }).
    catchError((error)
    {
      emit(NewsGetScienceErrorStateState(error.toString()),



      );

    });
  }

  bool isDark= true ;

  void changeMode()
  {
    isDark =!isDark;

    emit(NewsChangeModeState());
  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':value,
        'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value)
    {
      search = value.data['articles'];


      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}