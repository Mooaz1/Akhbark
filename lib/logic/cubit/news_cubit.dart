import 'package:akhbark/logic/cache/cache_helper.dart';
import 'package:akhbark/logic/dio/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
 static NewsCubit get(context) => BlocProvider.of(context);
  List all_topics = [];
  List general_list = [];
  List business_list = [];
  List enterrainment_list = [];
  List helth_list = [];
  List science_list = [];
  List sports_list = [];
  List tech_list = [];


void getDate()async{
 await getGeneralData();
 await getBussniesData();
  await getEnterrainmetData();
 await getHelthData();
await  getScienceData();
 await getSprotsData();
 await getTechData();
   
}
  Future<void> getGeneralData()async {
  await  DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'general',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      general_list = value.data['articles'];
      all_topics.add(general_list);
      print(general_list[0]['title']);
      emit(GetGeneralData());
    }).catchError((onError) {});
  }

  Future<void> getBussniesData()async {
   await DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      business_list = value.data['articles'];
      print(business_list);
      all_topics.add(business_list);

      emit(GetBussniesData());
    }).catchError((onError) {});
  }
   Future<void> getEnterrainmetData()async {
   await DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'entertainment',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      enterrainment_list = value.data['articles'];
      all_topics.add(enterrainment_list);

      emit(GetEnterrainmentData());
    }).catchError((onError) {});
  }
  Future<void> getHelthData()async {
  await  DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'health',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      helth_list = value.data['articles'];
      all_topics.add(helth_list);

      emit(GetHelthData());
    }).catchError((onError) {});
  }
   Future<void> getScienceData()async {
   await DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      science_list = value.data['articles'];
      all_topics.add(science_list);

      emit(GetScienceData());
    }).catchError((onError) {});
  }
 Future <void> getSprotsData()async {
   await DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      sports_list = value.data['articles'];
      all_topics.add(sports_list);

      emit(GetSportsData());
    }).catchError((onError) {});
  }
  Future<void> getTechData()async {
   await DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'technology',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      tech_list = value.data['articles'];
      all_topics.add(tech_list);

      emit(GetTechData());
    }).catchError((onError) {});
  }
  List search_list=[];

  Future<void> getSearch(String value)async {
   await DioHelper.getData(path: 'v2/everything', query: {
    
      'q': '$value',
      'apiKey': '47233fb935774e49981c3361550a7885',
    }).then((value) {
      search_list = value.data['articles'];
      

      emit(SearchState());
    }).catchError((onError) {});
  }
  int currentIndex=0;
  void changeIndexList(index){
    currentIndex=index;
    emit(ChangeIndex());

  }
  List<Map<String,dynamic>> fav_list=[];
  void getFavlist( list){
    fav_list.add(list);
    print(fav_list.length);
    emit(GetFavList());

  }
  bool isdark=true;
  void changeThemMode({bool? fromshared}){
    if (fromshared!=null)
    {
      isdark=fromshared;

    }
    else{
      isdark=!isdark;
    }
    
    CacheHelper.setData(key: "isDark",value: isdark).then(((value) {
      emit(CacheHelperState());
    })).catchError((onError){

    });
    emit(ChangeThemeMode());
  }
}
