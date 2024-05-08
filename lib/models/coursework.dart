class Coursework {
  // String thumbnail;
  // String name;
  // int noOfCourses;

  // Category({
  //   required this.name,
  //   required this.noOfCourses,
  //   required this.thumbnail,
  // });

  // String thumbnail;
  String id;
  String type;
  String name;
  // int noOfCourses;

  Coursework({
    required this.id,
    required this.type,
    required this.name,
  });
}

List<Coursework> courseworkList = [
  // Category(
  //   name: 'Development',
  //   noOfCourses: 55,
  //   thumbnail: 'assets/icons/laptop.jpg',
  // ),
  // Category(
  //   name: 'Accounting',
  //   noOfCourses: 20,
  //   thumbnail: 'assets/icons/accounting.jpg',
  // ),
  // Category(
  //   name: 'Photography',
  //   noOfCourses: 16,
  //   thumbnail: 'assets/icons/photography.jpg',
  // ),
  // Category(
  //   name: 'Product Design',
  //   noOfCourses: 25,
  //   thumbnail: 'assets/icons/design.jpg',
  // ),
  Coursework(
    id: "1",
    type: "homework",
    name: 'Lukisan Bendera Negara-Negara Asia',
  ),
  Coursework(
    id: "2",
    type: "extra_exercise",
    name: 'Latih Tubi Siri 1',
  ),
];
