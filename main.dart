import 'Node.dart';
import 'family_wrapper.dart';
main(List<String> args) {
  
  var family = FamilyUtility();

  print(family.addNode(1, "Saurabh Singh"));// new instance created
  print(family.addNode(2, "Saurabh Singh"));// new instance created
  print(family.addNode(3, "Saurabh Singh"));// new instance created
  print(family.addNode(4, "Saurabh Singh"));// new instance created
  print(family.addNode(5, "Saurabh Singh"));// new instance created
  print(family.addNode(6, "Saurabh Singh"));// new instance created
  print(family.addNode(7, "Saurabh Singh"));// new instance created
  print(family.addNode(8, "Saurabh Singh"));// new instance created

  family.addDependency(1, 2);// New depency added
  family.addDependency(1, 3);// New depency added
  family.addDependency(1, 4);// New depency added
  family.addDependency(1, 5);// New depency added
  
  // It will print Dependency alredy exist
  family.addDependency(5, 8);

  print(family.getDescendantById(1));// it will return all other nodes
  print(family.getChildren(1)); // it will return all child of 1






}