import 'ower_model.dart';

class Post {
  final List<Owner> owner;
  final String image;
  final String publishDate;
  final String text;
  final List tags;
  final String link;
  final int likes;

  Post({
    required this.owner,
    required this.image,
    required this.publishDate,
    required this.text,
    required this.tags,
    required this.link,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      owner: json['owner'],
      image: json['image'],
      publishDate: json['publishDate'],
      text: json['text'],
      tags: json['tags'],
      link: json['link'],
      likes: json['likes'],
    );
  }
}