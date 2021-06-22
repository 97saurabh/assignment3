import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../family_wrapper.dart';
import '../Node.dart';
void main() {
  group('Family of Nodes', () {

    Map<int,Node> nodes = {};
    var family = FamilyUtility();
    for (int i=0;i<10;i++){
      String name = "Random Node Name $i";
      int id = i;
      nodes[id] = family.addNode(id,name);
    }
    test('Craeting Alraedy Present nodes with same id', () {
      Node newNode = family.addNode(0,"Any Name");
      Node expectedNode = null;
      expect(newNode,expectedNode);
    });

    test('Craeting New Dependency', () {
      bool actual = family.addDependency(0, 1);
      bool expected = true;
      expect(actual,expected);

      actual = family.addDependency(0, 2);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(0,8);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(1, 5);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(1, 9);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(2, 3);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(2, 4);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(5, 9);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(5, 6);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(3, 9);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(3, 6);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(4, 8);
      expected = true;
      expect(actual,expected);

      actual = family.addDependency(6, 9);
      expected = true;
      expect(actual,expected);

      


    });


    test('Craeting Excisting Dependency  ( Cyclic  )', () {
      bool actual = family.addDependency(1, 0); 
      bool expected = false;
      expect(actual,expected);


      actual = family.addDependency(8, 0);
      expected = false;
      expect(actual,expected);

      actual = family.addDependency(9, 2);
      expected = false;
      expect(actual,expected);  


    });



    test('Get Ancestors of Nodes', () {
      Function equality = const ListEquality().equals;
      List<Node> actual = family.getAncestorsById(1); 
      List<Node> expected = [nodes[0]];
      expect(equality(actual,expected),true);
      actual = family.getAncestorsById(9); 
      expected = [nodes[5],nodes[1],nodes[3],nodes[2],nodes[6],nodes[0]];
      bool response =actual.any((item) => expected.contains(item)) && expected.any((item) => actual.contains(item));
      expect(response,true);
    });

    test('Get Desedents of Nodes', () {
      Function equality = const ListEquality().equals;
      List<Node> actual = family.getDescendantById(0); 
      List<Node> expected = [nodes[1],nodes[2],nodes[3],nodes[4],nodes[5],nodes[6],nodes[8],nodes[9]];
      bool response =actual.any((item) => expected.contains(item)) && expected.any((item) => actual.contains(item));
      expect(response,true);

      actual = family.getDescendantById(9); 
      expected = [];
      expect(actual,expected);

      actual = family.getDescendantById(2); 
      expected = [nodes[3],nodes[6],nodes[9],nodes[4],nodes[8]];
      response =actual.any((item) => expected.contains(item)) && expected.any((item) => actual.contains(item));
      expect(response,true);
    });


    test('Get Parents of Nodes', () {
      List<Node> actual = family.getParents(0); 
      List<Node> expected = [];
      expect(actual,expected);

      actual = family.getParents(9); 
      expected = [nodes[5],nodes[1],nodes[3],nodes[6]];
      bool response =actual.any((item) => expected.contains(item)) && expected.any((item) => actual.contains(item));
      expect(response,true);

      actual = family.getParents(8); 
      expected = [nodes[0],nodes[4]];
      response =actual.any((item) => expected.contains(item)) && expected.any((item) => actual.contains(item));
      expect(response,true);
    });

    test('Get Desedents of Nodes', () {
      List<Node> actual = family.getChildren(9); 
      List<Node> expected = [];
      expect(actual,expected);

      actual = family.getChildren(0); 
      expected = [nodes[1],nodes[2],nodes[3],nodes[4],nodes[5],nodes[6],nodes[8],nodes[9]];
      bool response =actual.any((item) => expected.contains(item)) && expected.any((item) => actual.contains(item));
      expect(response,true);

      actual = family.getChildren(2); 
      expected = [nodes[3],nodes[4]];
      response =actual.any((item) => expected.contains(item)) && expected.any((item) => actual.contains(item));
      expect(response,true);
    });


    test('Delete Desedents of Nodes', () {
      bool actual = family.deleteDependency(1,9); 
      bool expected = true;
      expect(actual,expected);

      actual = family.deleteDependency(1,9); 
      expected = false;
      expect(actual,expected);

      actual = family.deleteDependency(4,9); 
      expected = false;
      expect(actual,expected);
    });


    test('Delete Node', () {
      bool actual = family.deleteNode(2); 
      bool expected = true;
      expect(actual,expected);

      actual = family.deleteNode(2); 
      expected = false;
      expect(actual,expected);
    });    

  });
}