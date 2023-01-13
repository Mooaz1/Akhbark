part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class GetBussniesData extends NewsState{}
class GetGeneralData extends NewsState{}
class GetEnterrainmentData extends NewsState{}
class GetHelthData extends NewsState{}
class GetScienceData extends NewsState{}
class GetSportsData extends NewsState{}
class GetTechData extends NewsState{}
class ChangeIndex extends NewsState{}
class SearchState extends NewsState{}
class GetFavList extends NewsState{}
class ChangeThemeMode extends NewsState{}
class CacheHelperState extends NewsState{}



