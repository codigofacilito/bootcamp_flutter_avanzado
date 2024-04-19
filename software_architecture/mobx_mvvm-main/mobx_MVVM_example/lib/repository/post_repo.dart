import 'package:mobx_mvvm_example/data/network/api.dart';
import 'package:mobx_mvvm_example/model/post_model.dart';

import '../locator.dart';

abstract class PostRepo{
  Future<List<PostModel>> fetchPost();
  Future<PostModel> createPost(Map body);
  Future<PostModel> updatePost(int id,Map body);
  Future<bool> deletePost(int id);
}

class PostRepoImpl extends PostRepo{
  final Api _api = sl<Api>();

  @override
  Future<List<PostModel>> fetchPost() async{
    var jsonResponse = await _api.get("/posts/");
    return (jsonResponse as List).map((map) => PostModel.toObject(map)).toList();
  }

  @override
  Future<PostModel> createPost(Map body)async {
    var jsonResponse = await _api.post("/posts/", body);
    return PostModel.toObject(jsonResponse);
  }
  @override
  Future<PostModel> updatePost(int id,Map body) async{
    print("idd $id");
    print("body $body");
    var jsonResponse = await _api.put("/posts/$id", body);
    return PostModel.toObject(jsonResponse);
  }

  @override
  Future<bool> deletePost(int id) async{
    var jsonResponse = await _api.delete("/posts/$id");
    return jsonResponse.isEmpty;
  }

}