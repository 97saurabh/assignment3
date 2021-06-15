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
  print(obj1.addDependency(1, 3));
  print(obj1.addDependency(1, 4));
  print(obj1.addDependency(1, 5));
  print(obj1.addDependency(5, 8));
  print(obj1.addDependency(8, 1));




  
  dynamic data = obj1.data;

  dynamic o1 = data[1];
  print(o1.parents);
  print(o1.children);
  print("################################################");
  dynamic arr = obj1.getDescendantById(1);
  arr = arr['children'];
  for (dynamic key in arr){
    print(key.id);
  }
  print(" ");
  dynamic arr2 = obj1.getAncestorsById(8);
  
  arr = arr2['ancestors'];
  for (dynamic key in arr){
    print(key.id);
  }


}