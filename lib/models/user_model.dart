class UserModel {
  UserModel({
    required this.fullname,
    required this.firstname,
    required this.lastname,
    required this.position,
    required this.location,
    required this.bio,
    required this.photoUrl,
    required this.coverUrl,
    required this.phoneNumber,
    required this.contacts,
    required this.email,
    required this.organization,
    required this.socials,
    required this.links,
  });
  late final String fullname;
  late final String firstname;
  late final String lastname;
  late final String position;
  late final String location;
  late final String bio;
  late final String photoUrl;
  late final String coverUrl;
  late final String phoneNumber;
  late final List<String> contacts;
  late final String email;
  late final String organization;
  late final List<Socials> socials;
  late final List<Links> links;

  UserModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    position = json['position'];
    location = json['location'];
    bio = json['bio'];
    photoUrl = json['photoUrl'];
    coverUrl = json['coverUrl'];
    phoneNumber = json['phoneNumber'];
    contacts = List.castFrom<dynamic, String>(json['contacts']);

    if (json['socials'] != null) {
      socials = <Socials>[];
      json['socials'].forEach((v) {
        socials.add(Socials.fromJson(v));
      });
    }
    email = json['email'];
    organization = json['organization'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links.add(Links.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullname'] = fullname;
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['position'] = position;
    _data['location'] = location;
    _data['bio'] = bio;
    _data['photoUrl'] = photoUrl;
    _data['coverUrl'] = coverUrl;
    _data['phoneNumber'] = phoneNumber;
    _data['contacts'] = contacts;
    _data['email'] = email;
    _data['organization'] = organization;
    _data['socials'] = socials.map((v) => v.toJson()).toList();
    _data['links'] = links.map((v) => v.toJson()).toList();
    return _data;
  }
}

// class Socials {
//   Socials({
//     required this.facebook,
//     required this.twitter,
//     required this.instagram,
//     required this.linkedin,
//     required this.youtube,
//     required this.telegram,
//     required this.whatsapp,
//   });
//   late final String facebook;
//   late final String twitter;
//   late final String instagram;
//   late final String linkedin;
//   late final String youtube;
//   late final String telegram;
//   late final String whatsapp;

//   Socials.fromJson(Map<String, dynamic> json) {
//     facebook = json['facebook'];
//     twitter = json['twitter'];
//     instagram = json['instagram'];
//     linkedin = json['linkedin'];
//     youtube = json['youtube'];
//     telegram = json['telegram'];
//     whatsapp = json['whatsapp'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['facebook'] = facebook;
//     _data['twitter'] = twitter;
//     _data['instagram'] = instagram;
//     _data['linkedin'] = linkedin;
//     _data['youtube'] = youtube;
//     _data['telegram'] = telegram;
//     _data['whatsapp'] = whatsapp;

//     return _data;
//   }
// }

class Socials {
  String? name;
  String? url;

  Socials({
    this.name,
    this.url,
  });

  Socials.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Links {
  String? name;
  String? url;
  String? faviconUrl;

  Links({this.name, this.url, this.faviconUrl});

  Links.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    faviconUrl = json['faviconUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['faviconUrl'] = this.faviconUrl;
    return data;
  }
}
