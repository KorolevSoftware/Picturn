import 'package:flutter/cupertino.dart';
import 'package:picturn/Models/post.dart';
import 'package:picturn/Models/profile.dart';
import 'package:picturn/Repositories/post_repository.dart';

class PostViewModel extends ChangeNotifier {
  final Post post;
  PostRepository _postRepository;

  PostViewModel(this._postRepository,{this.post});

  bool trySetLike() {
    this.post.isLiked = !this.post.isLiked;
    this.post.isLiked ? this.post.likesCount++ : this.post.likesCount--;
    _postRepository.sendPostLikes(post);
    return this.post.isLiked;
  }

  //TODO
  Future<void> updateLike() async {
    notifyListeners();
  }

  Future<String> get getImagePath async => await this._postRepository.getImagePath(post.imageID);

  String get getAuthor => this.post.profile.nickName;

  DateTime get getDate => this.post.date;

  Profile get getProfile => this.post.profile;

  bool get getIsLiked => this.post.isLiked;

  String get getAvatarImagePath => this.post.profile.avatarImagePath;

  int get getLikesCount => this.post.likesCount;
}
