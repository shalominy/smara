class Categorylist {
  // String thumbnail;
  // String name;
  // int noOfCourses;

  // Category({
  //   required this.name,
  //   required this.noOfCourses,
  //   required this.thumbnail,
  // });

  // String thumbnail;
  String kategori;
  String name;
  // int noOfCourses;

  Categorylist({
    required this.kategori,
    required this.name,
  });
}

List<Categorylist> categoryList = [
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
  Categorylist(
    kategori: "1",
    name: 'Teachers',
  ),
  Categorylist(
    kategori: "4",
    name: 'Students',
  ),
];
