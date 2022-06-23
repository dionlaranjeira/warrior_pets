class DogBreed {
  int? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;
  Photo? image;

  DogBreed(
      {
        this.id,
        this.name,
        this.bredFor,
        this.breedGroup,
        this.lifeSpan,
        this.temperament,
        this.origin,
        this.referenceImageId,
        this.image});

  DogBreed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
    image = json['image'] != null ? new Photo.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bred_for'] = this.bredFor;
    data['breed_group'] = this.breedGroup;
    data['life_span'] = this.lifeSpan;
    data['temperament'] = this.temperament;
    data['origin'] = this.origin;
    data['reference_image_id'] = this.referenceImageId;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }

  String get nameString {
    if (name == null || name!.isEmpty ){
      return "Not Found";
    }
    return name!;
  }


  String get bredForString {
    if (bredFor == null || bredFor!.isEmpty){
      return "Not Found";
    }
    return bredFor!;
  }

  String get breedGroupString {
    if (breedGroup == null || breedGroup!.isEmpty ){
      return "Not Found";
    }
    return breedGroup!;
  }

  String get lifeSpanString {
    if (lifeSpan! == null || lifeSpan!.isEmpty){
      return "Not Found";
    }
    return lifeSpan!;
  }

  String get temperamentString {
    if (temperament == null || temperament!.isEmpty){
      return "Not Found";
    }
    return temperament!;
  }

  String get originString {
    if (origin == null || origin!.isEmpty){
      return "Not Found";
    }
    return origin!;
  }

}

class Measure {
  String? imperial;
  String? metric;

  Measure({this.imperial, this.metric});

  Measure.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}

class Photo {
  String? id;
  int? width;
  int? height;
  String? url;

  Photo({this.id, this.width, this.height, this.url});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    return data;
  }

}