// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostState on _PostStateBase, Store {
  late final _$loadingAtom =
      Atom(name: '_PostStateBase.loading', context: context);

  @override
  Observable<bool> get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(Observable<bool> value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$postsAtom = Atom(name: '_PostStateBase.posts', context: context);

  @override
  ObservableList<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$fetchPostsAsyncAction =
      AsyncAction('_PostStateBase.fetchPosts', context: context);

  @override
  Future<dynamic> fetchPosts() {
    return _$fetchPostsAsyncAction.run(() => super.fetchPosts());
  }

  late final _$createPostAsyncAction =
      AsyncAction('_PostStateBase.createPost', context: context);

  @override
  Future<dynamic> createPost(PostModel postModel) {
    return _$createPostAsyncAction.run(() => super.createPost(postModel));
  }

  late final _$updatePostAsyncAction =
      AsyncAction('_PostStateBase.updatePost', context: context);

  @override
  Future<dynamic> updatePost(PostModel postModel) {
    return _$updatePostAsyncAction.run(() => super.updatePost(postModel));
  }

  late final _$removePostAsyncAction =
      AsyncAction('_PostStateBase.removePost', context: context);

  @override
  Future removePost(PostModel postModel) {
    return _$removePostAsyncAction.run(() => super.removePost(postModel));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
posts: ${posts}
    ''';
  }
}
