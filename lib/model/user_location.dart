class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final locationCoordinates coordinates;
  final locationStreet street;
  final locationTimezone timezone;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.street,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> e){
    final timezone = locationTimezone.fromMap(e['timezone'] );
    final street = locationStreet.fromMap(e['street']);
    final coordinates = locationCoordinates.fromMap(e['coordinates']);
    return UserLocation(
      city: e['city'],
      state: e['state'],
      country: e['country'],
      postcode: e['postcode'].toString(),
      coordinates: coordinates,
      street: street,
      timezone: timezone,
    );
  }

}


class locationCoordinates {
  final String latitude;
  final String longitude;
  locationCoordinates({
    required this.latitude,
    required this.longitude,
  });
  factory locationCoordinates.fromMap(Map<String, dynamic> e){
    return locationCoordinates(
        latitude: e['latitude'],
        longitude: e['longitude']
    );
  }
}

class locationStreet {
  final int number;
  final String name;
  locationStreet({
    required this.name,
    required this.number
  });
  factory locationStreet.fromMap(Map<String, dynamic> e) {
    return locationStreet(
        name: e['name'],
        number: e['number']
    );
  }
}

class locationTimezone {
  final String offset;
  final String description;
  locationTimezone({
    required this.description,
    required this.offset
  });
  factory locationTimezone.fromMap(Map<String, dynamic> e){
    return locationTimezone(
        description: e['description'],
        offset: e['offset']
    );
  }
}