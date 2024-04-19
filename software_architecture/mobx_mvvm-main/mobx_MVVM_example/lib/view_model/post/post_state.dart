import 'package:mobx/mobx.dart';
import 'package:mobx_mvvm_example/main_store/main_state.dart';
import 'package:mobx_mvvm_example/model/post_model.dart';
import 'package:mobx_mvvm_example/repository/post_repo.dart';

import '../../locator.dart';
part 'post_state.g.dart';

class PostState = _PostStateBase with _$PostState;

abstract class _PostStateBase with Store {
  late MainState main;

  _PostStateBase({required this.main});

  final PostRepoImpl _postRepoImpl= sl<PostRepoImpl>();

  @observable
  Observable<bool>loading = Observable(false);

  @observable
  ObservableList<PostModel> posts = ObservableList<PostModel>();

  @observable
  Observable<PostModel?> currentPost= Observable(null);

  @action
  Future fetchPosts() async {
    loading.value = true;
    posts.clear();
    posts.addAll(await _postRepoImpl.fetchPost().asObservable());
    loading.value = false;
  }

  @action
  Future createPost(PostModel postModel)async{
    PostModel post = await _postRepoImpl.createPost(postModel.toMap());
    posts.add(post);
  }

  @action
  Future updatePost(PostModel postModel)async{
    PostModel post = await _postRepoImpl.updatePost(postModel.id,postModel.toMap());
    posts[posts.indexWhere((element) => element.id == post.id)] = post;
  }

  @action
  removePost(PostModel postModel)async{
    await _postRepoImpl.deletePost(postModel.id);
    posts.removeWhere((element) => element ==postModel);
  }

  @action
  addCurrentPost(postModel){
    currentPost.value= postModel;
  }

  @computed
  bool get hasCurrentPost => currentPost.value!=null;

}