import 'parents/model.dart';

class Global extends ParentModel {

  String? laravelBaseUrl;
  String? apiPath;


  Global({ this.laravelBaseUrl, this.apiPath});

  Global.fromJson(Map<String, dynamic> json) {
    laravelBaseUrl = json['laravel_base_url'].toString();
    apiPath = json['api_path'].toString();

  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['laravel_base_url'] = laravelBaseUrl;
    data['api_path'] = apiPath;
    return data;
  }
}
