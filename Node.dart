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
  set node_name(String name){
    this.name = name;
  }
  set node_id(int id){
    this.id = id;
  }
  set add_parent(Node parent){
    this.parents[parent] = true;
    
  }
  set add_child(Node child){
    this.children[child] = true;
  }

  // gettres
  String get node_name{
    return this.name;
  }
  int get node_id{
    return this.id;
  }
  List<Node> get add_parents{
    return this.parents.keys.toList();
    
  }
  List<Node> get add_children{
    return this.children.keys.toList();
  }    
}