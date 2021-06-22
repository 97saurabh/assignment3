import 'Node.dart';

// Sigleton Class
// It is Utility class for Node
// All functionality of Family will be controlled by this part of code
class FamilyUtility {

  static final FamilyUtility _singleton = FamilyUtility._internal();
  // Singlton Class
  factory FamilyUtility() {
    return _singleton;
  }
  FamilyUtility._internal();

  // Wrapper Class for Node.dart
  Node root;// node of root 
  Map<int,Node> data = {}; // it will store id and there associated Node 

  // Assign root
  void setRoot(Node root){
    if (root == null){
      this.root = root;
    }
    else{
      print("...Root already Exist....");
    }
  }
  Node getRoot(){
    return root;
  }
  // Required Functinality

  // It will return List of Parents of given node id
  List<Node> getParents(int id){
    Node node = _getNodeById(id);
    List<Node> parents;
    if (node != null){
      parents = node.parents.keys.toList();
    }
    return parents;
  }

  // It will return List of Children of given node id 
  List<Node> getChildren(int id){
    Node node = _getNodeById(id);
    List<Node> children;
    if (node != null){
    children = node.children.keys.toList();
    }
    return children;
  }

  // Create a new Node, id should be unique
  Node addNode(int id,String name){
    Node node = _getNodeById(id);
    if (node != null){
      return null;
    }
    else{
      Node node = Node(id,name);
      this.data[id] = node;
      return node;
    }
    }
  
  
  // It will return list of all the ancestors of given node id
  List<Node> getAncestorsById(int id){
    Node node = _getNodeById(id);
    if (node != null){
      List<Node> ancestors = _getAncestors(node);
      return ancestors;
    }
    return null;
  }

  // It will return list of all the Descendant of given node id
  List<Node> getDescendantById(int id){
    Node node = _getNodeById(id);
    if (node != null){
      List<Node> children = _getDescendant(node);
      return children;
    }
    return null;
  }

  // Add dependencies between two nodes, provided id of two nodes
  bool addDependency(int parentId,int childId){        
    Node parentNode = _getNodeById(parentId);
    Node childNode = _getNodeById(childId);
    if (parentNode == null && childNode == null ){
      print("Parent and Child node does not Exist");
    }
    else if (parentNode == null){
      print("Parent  node does not Exist");
    }
    else if(childNode == null){
      print("Parent and Child node does not Exist");
    }
    else{
      List<Node> parentsNods = _getAncestors(parentNode);
      List<Node> childrenNods = _getDescendant(childNode);      
      if(! parentsNods.contains(childNode) && ! childrenNods.contains(parentNode)){
      parentNode.children[childNode] = true;
      childNode.parents[parentNode] = true;
      return true;  
      }
      else{
        print("Dependency Already Exist,, Creating New Dependencies will give Cyclic Family Structure");
      }
    }
    return false;
  }
  
  // Delete dependencies between two nodes, provided id of two nodes
  bool deleteDependency(int parentId,int childId){ 
    Node parentNode = _getNodeById(parentId);
    Node childNode = _getNodeById(childId);
    if (parentNode == null && childNode == null ){
      print("Parent and Child node does not Exist");
    }
    else if (parentNode == null){
      print("Parent  node does not Exist");
    }
    else if(childNode == null){
      print("Parent and Child node does not Exist");
    }
    else{
      
      if (parentNode.children.containsKey(childNode) && childNode.parents.containsKey(parentNode)){
      parentNode.children.remove(childNode);
      childNode.parents.remove(parentNode);
      return true;
    }
      else{
        print("Dependency does not Exist");
      }
    }
    return false;
  }

  // Remove a node and all its dependies
  bool deleteNode(int id){
    Node node = _getNodeById(id);
    if (node != null){
      for (Node key in node.parents.keys){
          key.children.remove(node);  
      }
      for (Node key in node.children.keys){
        key.parents.remove(node);  
      }
      node.parents = {};
      node.children = {};
      _deleteNodeById(id);
      print('Deleted');
      return true;
    }
    return false;
  }

  // Private Functions

  // will give object of given node
  Node _getNodeById(int id){
    return data[id];
  }
  // it will delete node from local data varible
  void _deleteNodeById(int id){
    if(data.containsKey(id)){
      data.remove(id);
      }
  }
  // Code to find all ancestors of given node
  List<Node> _getAncestors(Node node){
    List<Node> result = [];
    List<Node>  parents = [];
    parents = node.parents.keys.toList();

    while (parents.length > 0){
      Node temp = parents.removeAt(0);
      if (! result.contains(temp) ){
        parents.addAll(temp.parents.keys.toList());
        result.add(temp);
      }
    }
    return result;
  }
  // Code to find all Descendant of given node
  List<Node> _getDescendant(Node node){

    //print(".......Getting Children ........");
    List<Node> result = [];
    List<Node>  children = [];
    children = node.children.keys.toList();

    while (children.length > 0){
      Node temp = children.removeAt(0);
      if (! result.contains(temp) ){
        children.addAll(temp.children.keys.toList());
        result.add(temp);
      }
    }
    //print(".......Getting Children ........");
    return result;
  }
}