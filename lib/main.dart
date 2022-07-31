import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/cubit/controller.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/constant/bloc_observer.dart';
import 'package:news_app/shared/network/dio_helper.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  MyBlocObserver();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsController(),

      child: BlocConsumer<NewsController, NewsStates>(
        listener: (context,state){},
        builder: (context,state){
         return MaterialApp(
            title: 'News Feed Application',
            debugShowCheckedModeBanner: false,

            theme:
            ThemeData(
              appBarTheme: const AppBarTheme(
                  color: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,



                  ),
                  iconTheme: IconThemeData(
                      color: Colors.black,
                      size: 14
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark,

                  )
              ),

              bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.shifting,
                  elevation: 20.0,
                  selectedItemColor: HexColor('#ffc0cb'),
                  unselectedItemColor: Colors.black12
              ),

            ),
            darkTheme:
            ThemeData(
              scaffoldBackgroundColor: HexColor('#4c535a'),
              appBarTheme:  AppBarTheme(
                  elevation: 0.0,
                  backgroundColor: HexColor('#4c535a'),
                  titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,



                  ),
                  iconTheme: const IconThemeData(
                      color: Colors.white,
                      size: 14
                  ),
                  systemOverlayStyle:  SystemUiOverlayStyle(
                    statusBarColor:HexColor('#4c535a'),
                    statusBarBrightness: Brightness.light,

                  )
              ),

              bottomNavigationBarTheme:  BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,

                elevation: 0.0,
                selectedItemColor: HexColor('#ffc0cb'),
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('#4c535a'),
              ),
              textTheme: const TextTheme(
                  bodyText2: TextStyle(
                      color: Colors.white70
                  )
              ),

            ),
            themeMode:NewsController.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            home:  News_layout(),
          );
        },
      ),
    );
  }
}

