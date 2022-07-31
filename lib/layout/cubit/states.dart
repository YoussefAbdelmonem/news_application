abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsChangeModeState extends NewsStates{}

class NewsBottomNavigationState extends NewsStates{}

class NewsGetBusinessLoadingStateState extends NewsStates{}

class NewsGetBusinessSuccessStateState extends NewsStates{}

class NewsGetBusinessErrorStateState extends NewsStates
{
  final String error;

  NewsGetBusinessErrorStateState(this.error);
}

class NewsGetSportLoadingStateState extends NewsStates{}

class NewsGetSportSuccessStateState extends NewsStates{}

class NewsGetSportErrorStateState extends NewsStates
{
  final String error;

  NewsGetSportErrorStateState(this.error);
}
class NewsGetScienceLoadingStateState extends NewsStates{}

class NewsGetScienceSuccessStateState extends NewsStates{}

class NewsGetScienceErrorStateState extends NewsStates
{
  final String error;

  NewsGetScienceErrorStateState(this.error);
}
class NewsGetGeneralLoadingStateState extends NewsStates{}

class NewsGetGeneralSuccessStateState extends NewsStates{}

class NewsGetGeneralErrorStateState extends NewsStates
{
  final String error;

  NewsGetGeneralErrorStateState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates
{
  final String error;

  NewsGetSearchErrorState(this.error);
}