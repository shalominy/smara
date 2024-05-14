class DataList {
  // String thumbnail;
  // String name;
  // int noOfCourses;

  // Category({
  //   required this.name,
  //   required this.noOfCourses,
  //   required this.thumbnail,
  // });

  // String thumbnail;
  String list;
  String name;
  String upload;
  // int noOfCourses;

  DataList({
    required this.list,
    required this.name,
    required this.upload,
  });
}

List<DataList> categoryList = [
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
  DataList(
    upload: "UploadTeacherData",
    list: "TeacherList",
    name: 'Teachers',
  ),
  DataList(
    upload: "UploadStudentData",
    list: "StudentList",
    name: 'Students',
  ),
  DataList(
    upload: "UploadUserData",
    list: "UserList",
    name: 'Users',
  ),
];
