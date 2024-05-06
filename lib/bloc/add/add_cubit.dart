// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart'; 

// part 'add_state.dart';

// class AddCubit extends Cubit<AddState> {
//   AddCubit() : super(AddInitial());

//   PostsRepo postsRepo = PostsRepo();

//   Future submitPost(BuildContext context, sc, PostModel newpost) async {
//     emit(AddsmileLoading());
//     print("------submit post----");

//     newpost.daystogo = daytoGo(newpost.categories!);

//     newpost.roadmap = ["", "", "", "", ""];
//     newpost.news = ["", "", ""];
//     newpost.questions = ["", "", ""];

//     try {
//       await postsRepo.addProject(context, newpost);

//       emit(Addsmiledone());
//       Navigator.pushNamed(context, BottomTabBarr.routeName);
//     } catch (e) {
//       Mystyle.err(sc, e.toString());
//       emit(AddsmileError(e.toString()));
//     }
//   }

//   Future submitTrio(BuildContext context, sc, PostModel newpost) async {
//     emit(AddsmileLoading());
//     print("------submit post----");

//     try {
//       await postsRepo.addtrio(context, newpost);

//       emit(Addsmiledone());
//       Navigator.pushNamed(context, BottomTabBarr.routeName);
//     } catch (e) {
//       Mystyle.err(sc, e.toString());
//       emit(AddsmileError(e.toString()));
//     }
//   }

//   int daytoGo(String category) {
//     switch (category) {
//       case "ازدهار":
//         return 50; // from 30 to 80
//       case "اختراع":
//         return 60;
//       case "مشاريع عملاقة":
//         return 30;
//       case "ديجيتال":
//         return 30;
//       case "حاضنات":
//         return 90;
//       case "مسابقات":
//         return 20;
//       default:
//         return 30;
//     }
//   }
// }



//       // }
//       //  on TimeoutException catch (e) {
//       //   print('Timeout Error: $e');
//       //   emit(AddsmileError(e.toString()));
//       //   Mystyle.err(
//       //     e.toString(),
//       //     "error : please check your internet connection",
//       // );