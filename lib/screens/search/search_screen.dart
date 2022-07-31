


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/controller.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/component.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsController, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsController.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value) {
                    NewsController.get(context).getSearch(value);
                  },
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                child: buildArticle(
                  list,
                  context,

                ),
              ),
            ],
          ),
        );
      },
    );
     }}