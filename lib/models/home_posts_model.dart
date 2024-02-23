import 'package:tick_tok/models/parents/model.dart';

class HomePostsModel {
  HomePostsModel({
    this.status,
    this.message,
    this.posts,
  });

  bool? status;
  String? message;
  List<Posts>? posts;

  HomePostsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    posts = List.from(json['posts']).map((e) => Posts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['posts'] = posts?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Posts extends ParentModel{
  Posts({
    // this.postId,
    // this.userId,
    // this.typeId,
    // this.payType,
     this.price,
    this.currency,
    //this.status,
    this.website,
    this.isPromote,
    this.promotDuration,
    this.campaignType,
    this.campDate,
    this.campTime,
    this.description,
    this.postVideo,
    this.hashtags,
    this.hashtagTitles,
    this.profileImage,
    this.name,
    //this.countryId,
    this.country,
    this.flag,
    this.currencyFlag,
    //this.laqtaCoins,
    this.postTitle,
    //this.displaySaltaries,
    this.content,
    this.images,
    this.likes,
    this.shares,
    this.comments,
    this.offers,
    this.type,
    //this.survey,
  });

  // int? postId;
  // int? userId;
  // int? typeId;
  // int? payType;
   int? price;
  String? currency;
  // int? status;
  String? website;
  int? isPromote;
  int? promotDuration;
  String? campaignType;
  String? campDate;
  String? campTime;
  String? description;
  String? postVideo;
  String? hashtags;
  String? hashtagTitles;
  String? profileImage;
  String? name;
  //int? countryId;
  String? country;
  String? flag;
  String? currencyFlag;
  //int? laqtaCoins;
  String? postTitle;
  //int? displaySaltaries;
  String? content;
  List<Images>? images;
  int? likes;
  int? shares;
  int? comments;
  int? offers;
  String? type;
  //Survey? survey;

  Posts.fromJson(Map<String, dynamic> json) {
    // postId = intFromJson(json, 'post_id');
    // userId = intFromJson(json, 'user_id');
    // typeId = json['type_id'];
    // payType = json['pay_type'];
     price = intFromJson(json, 'price');
    currency = stringFromJson(json, 'currency');
    //status = intFromJson(json, 'status');
    website = stringFromJson(json, 'website');
    isPromote = intFromJson(json, 'is_promote');
    promotDuration = intFromJson(json, 'promot_duration');
    campaignType = stringFromJson(json, 'campaign_type');
    campDate =  stringFromJson(json, 'camp_date');
    campTime =  stringFromJson(json, 'camp_time');
    description =  stringFromJson(json, 'description');
    postVideo =  stringFromJson(json, 'post_video');
    hashtags =  stringFromJson(json, 'hashtags');
    hashtagTitles =  stringFromJson(json, 'hashtag_titles');
    profileImage =  stringFromJson(json, 'profile_image');
    name =  stringFromJson(json, 'name');
    //countryId = json['country_id'];
    country =  stringFromJson(json, 'country');
    flag =  stringFromJson(json, 'flag');
    currencyFlag =  stringFromJson(json, 'currency_flag');
    //laqtaCoins = json['laqta_coins'];
    postTitle =  stringFromJson(json, 'post_title');
    //displaySaltaries = json['display_saltaries'];
    content =  stringFromJson(json, 'content');
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    likes = intFromJson(json, 'likes');
    shares = intFromJson(json, 'shares');
    comments = intFromJson(json, 'comments');
    offers = intFromJson(json, 'offers');
    type = stringFromJson(json,'type');
    // survey = json['survey'];
  }

  @override
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['post_id'] = postId;
    // _data['user_id'] = userId;
    // _data['type_id'] = typeId;
    // _data['pay_type'] = payType;
    // _data['price'] = price;
    _data['currency'] = currency;
   // _data['status'] = status;
    _data['website'] = website;
    _data['is_promote'] = isPromote;
    _data['promot_duration'] = promotDuration;
    _data['campaign_type'] = campaignType;
    _data['camp_date'] = campDate;
    _data['camp_time'] = campTime;
    _data['description'] = description;
    _data['post_video'] = postVideo;
    _data['hashtags'] = hashtags;
    _data['hashtag_titles'] = hashtagTitles;
    _data['profile_image'] = profileImage;
    _data['name'] = name;
    //_data['country_id'] = countryId;
    _data['country'] = country;
    _data['flag'] = flag;
    _data['currency_flag'] = currencyFlag;
    //_data['laqta_coins'] = laqtaCoins;
    _data['post_title'] = postTitle;
    //_data['display_saltaries'] = displaySaltaries;
    _data['content'] = content;
    _data['images'] = images?.map((e) => e.toJson()).toList();
    _data['likes'] = likes;
    _data['shares'] = shares;
    _data['comments'] = comments;
    _data['offers'] = offers;
    _data['type'] = type;
    //_data['survey'] = survey;
    return _data;
  }
}

class Images {
  Images({
    this.image,
    this.isFirstPic,
  });

  String? image;
  int? isFirstPic;

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isFirstPic = json['is_first_pic'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['is_first_pic'] = isFirstPic;
    return data;
  }
}

class Survey {
  Survey({
    this.id,
    this.advertisementId,
    this.question,
    this.option_1,
    this.option_2,
    this.option_3,
    this.option_4,
  });

  int? id;
  int? advertisementId;
  String? question;
  String? option_1;
  String? option_2;
  String? option_3;
  String? option_4;

  Survey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    advertisementId = json['advertisement_id'];
    question = json['question'];
    option_1 = json['option_1'];
    option_2 = json['option_2'];
    option_3 = json['option_3'];
    option_4 = json['option_4'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['advertisement_id'] = advertisementId;
    data['question'] = question;
    data['option_1'] = option_1;
    data['option_2'] = option_2;
    data['option_3'] = option_3;
    data['option_4'] = option_4;
    return data;
  }
}
