import 'Family.dart';
import 'FamilyWrapper.dart';
main(List<String> args) {
  var obj1 = Singleton();

  print(obj1.addNode(1, "Saurabh Singh"));
  print(obj1.addNode(2, "Saurabh Singh"));
  print(obj1.addNode(3, "Saurabh Singh"));
  print(obj1.addNode(4, "Saurabh Singh"));
  print(obj1.addNode(5, "Saurabh Singh"));
  print(obj1.addNode(6, "Saurabh Singh"));
  print(obj1.addNode(7, "Saurabh Singh"));
  print(obj1.addNode(8, "Saurabh Singh"));

  print(obj1.addDependency(1, 2));
  //print(obj1.addDependency(1, 3));
  //print(obj1.addDependency(1, 4));
  //print(obj1.addDependency(1, 5));
  print(obj1.getChildren(1)['children'][0].id);




}