import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostsRepository videoPostsRepository;

  DiscoverProvider({
    required this.videoPostsRepository
  });

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos =
    //     videoPosts
    //         .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //         .toList();

    final List<VideoPost> newVideos = await videoPostsRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
