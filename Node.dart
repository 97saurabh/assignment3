// Node Class
// It will store all data regarding a node, include nodes (name,id,parents list, chisdren list)
class Node {

  String name;//name of node
  int id;// unique id of node
  Map<Node,bool> parents = {};// it will store true if node is present, node will be key
  Map<Node,bool> children = {};//it will store true if node is present, node will be key

  Node(int id,String name){
    this.id  = id;
    this.name = name;
  }
  // Setters
  set nodeName(String name){
    this.name = name;
  }
  set nodeId(int id){
    this.id = id;
  }
  set addParent(Node parent){
    this.parents[parent] = true;
    
  }
  set addChild(Node child){
    this.children[child] = true;
  }

  // gettres
  String get nodeName{
    return this.name;
  }
  int get nodeId{
    return this.id;
  }
  List<Node> get addParents{
    return this.parents.keys.toList();
    
  }
  List<Node> get addChildren{
    return this.children.keys.toList();
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Node Id:- $id";
  }

}