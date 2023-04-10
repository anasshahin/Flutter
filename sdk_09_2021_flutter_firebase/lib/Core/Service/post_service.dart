import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:sdk_09_2021_flutter_firebase/FirebaseRealTimeDataBase/Example1/Model/post_model.dart';

class PostService {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  DatabaseReference? databaseReference;

  String root = 'MrRoot/RealTimeDatabase';
  String subRoot = 'PostData';

  Future<PostList> getPosts() async {
    databaseReference = _firebaseDatabase.ref();

    DatabaseEvent query = await databaseReference!
        .child(root)
        .child(subRoot)
        .orderByValue()
        .once();
    log('result : ${query.snapshot.value}');
    log('result.runtimeType : ${query.snapshot.value.runtimeType}');
    var finalList = [];
    if (query.snapshot.exists) {
      var dataMap = query.snapshot.value as Map<dynamic, dynamic>;
      dataMap.forEach((key, value) {
        finalList.add(value);
      });

      log('finalList : $finalList');
      var model = PostList.fromJson(finalList);
      return model;
    } else {
      return PostList(posts: []);
    }
  }

  Future<PostModel> getPostsById(String id) async {
    databaseReference = _firebaseDatabase.ref();
    DatabaseEvent query =
        await databaseReference!.child(root).child(subRoot).equalTo(id).once();
    var data = query.snapshot.value;
    var model = PostModel.fromJson(data as Map<String, dynamic>);
    return model;
  }

  Future<int> addPost(PostModel model) async {
    int result = 0;
    databaseReference = _firebaseDatabase.ref();
    await databaseReference!
        .child(root)
        .child(subRoot)
        .child(model.id!)
        .set(model.toJson())
        .whenComplete(() {
      log('post added successfully');
      result = 1;
    });
    return result;
  }

  Future<void> updatePost(String id, PostModel model) async {
    databaseReference = _firebaseDatabase.ref('$root/$subRoot/$id');
    await databaseReference!.update(model.toJson());
  }

  Future<void> deletePost(String id) async {
    databaseReference = _firebaseDatabase.ref('$root/$subRoot/$id');
    await databaseReference!.remove();
  }
}
