class DogBreed {
  int? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;

  DogBreed(
      {this.id,
        this.name,
        this.bredFor,
        this.breedGroup,
        this.lifeSpan,
        this.temperament,
        this.origin,
        this.referenceImageId});

  DogBreed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
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
    return data;
  }
}