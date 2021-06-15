import 'Family.dart';
class Singleton {

  static final Singleton _singleton = Singleton._internal();
  // Singlton Class
  factory Singleton() {
    return _singleton;
  }
  Singleton._internal();

  // Wrapper Class for Family.dart
  Family root;
  Map<int,Family> data = {};

  void setRoot(Family root){
    if (root == null){
      this.root = root;
    }
    else{
      print("...Root already Exist....");
    }
  }
  Family getRoot(){
    return root;
  }
  // Required Functinality
  Map<String,dynamic> getParents(int id){
    Map<String,dynamic> result = _getNodeById(id);
    if (result['status']){
    result['parents'] = data["node"].parents.keys.toList();
    result.remove("node");
    }
    return result;
  }
  Map<String,dynamic> getChildren(int id){
    Map<String,dynamic> result = _getNodeById(id);
    if (result['status']){
    result['children'] = result["node"].children.keys.toList();
    result.remove("node");
    }
    return result;
  }
  Map<String,dynamic> addNode(int id,String name){
    Map<String,dynamic> result = _getNodeById(id);
    if (result['status']){
      result['status'] = false;
      result['message'] = "Node already exist with same id";
      result.remove('node');
    }
    else{
      Family node = Family(id,name);
      this.data[id] = node;
      result['status'] = true;
      result['node'] = node;
      result.remove("message");

    }
     return result;
    }
  
  

  Map<String,dynamic> getAncestorsById(int id){
    Map<String,dynamic> result = _getNodeById(id);
    if (result['status']){
      Family node = result['node'];
      List<Family> ancestors = _getAncestors(node);
      result['ancestors'] = ancestors;
      result.remove('node');
    }
    return result;
  }

  Map<String,dynamic> getChildrensById(int id){
    Map<String,dynamic> result = _getNodeById(id);
    if (result['status']){
      Family node = result['node'];
      List<Family> children = _getChildren(node);
      result['children'] = children;
      result.remove('node');
    }
    return result;
  }

  Map<String,dynamic> addDependency(int parentId,int childId){
    Map<String,dynamic> result = {'status' : false};
        
    Map<String,dynamic> parentNode = _getNodeById(parentId);
    Map<String,dynamic> childNode = _getNodeById(childId);

    if (parentNode['status'] == false && childNode['status'] == false ){
      result['message'] = "Parent and Child node does not Exist";
      return result;
    }
    else if (parentNode['status'] == false){
      result['message'] = "Parent  node does not Exist";
      return result;
    }
    else if(childNode['status'] == false){
      result['message'] = "Parent and Child node does not Exist";
      return result;
    }
    else{
      Family parent = parentNode['node'],child = parentNode['node'];
      List<Family> parentsNods = _getAncestors(parent);
      List<Family> childrenNods = _getChildren(child);
      
      if(! parentsNods.contains(child) && ! childrenNods.contains(parent)){
      parent.children[child] = true;
      child.parents[parent] = true;
      result['status'] = true;  
      }
      else{
        result['message'] = "Dependency Already Exist";
      }
      return result;
    }
  }
  Map<String,dynamic> deleteDependency(int parentId,int childId){
    Map<String,dynamic> result = {'status' : false};
        
    Map<String,dynamic> parentNode = _getNodeById(parentId);
    Map<String,dynamic> childNode = _getNodeById(childId);

    if (parentNode['status'] == false && childNode['status'] == false ){
      result['message'] = "Parent and Child node does not Exist";
      return result;
    }
    else if (parentNode['status'] == false){
      result['message'] = "Parent  node does not Exist";
      return result;
    }
    else if(childNode['status'] == false){
      result['message'] = "Parent and Child node does not Exist";
      return result;
    }
    else{
      Family parent = parentNode['node'],child = parentNode['node'];
      List<Family> parentsNods = _getAncestors(parent);
      List<Family> childrenNods = _getChildren(child);
      if (parent.children.containsKey(childrenNods) && child.parents.containsKey(parentsNods)){
      parent.children.remove(child);
      child.parents.remove(parent);
      result['status'] = true;

    }
      else{
        result['message'] = "Dependency Already not Exist";
      }
      return result;
    }
  }
  Map<String,dynamic> deleteNode(int id){
    Map<String,dynamic> result = _getNodeById(id);
    if (result['status']){
      Family node = result['node'];
      for (Family key in node.parents.keys){
          key.children.remove(node);  
      }
      for (Family key in node.children.keys){
        key.parents.remove(node);  
      }
      node.parents = {};
      node.children = {};
      _deleteNodeById(id);
      result.remove('node');

    }
    return result;
  }

  // Private Functions 
  Map<String,dynamic> _getNodeById(int id){
    Map<String,dynamic> result = {"status" : false};
    if(data.containsKey(id)){
      result['status'] = true;
      result['node'] = data[id];
    }
    else{
      result['message'] = "This Id does not exist";
    }
    return result;
  }
  Map<String,dynamic> _deleteNodeById(int id){
    Map<String,dynamic> result = {"status" : false};
    if(data.containsKey(id)){
      result['status'] = true;
      data.remove(id);
    }
    else{
      result['message'] = "This Id does not exist";
    }
    return result;
  }
  List<Family> _getAncestors(Family node){
    List<Family> data = node.parents.keys.toList();
    for (Family key in node.parents.keys){
        if (! data.contains(key)){
            List<Family> arr = _getAncestors(key);
            data.addAll(arr);
        }          
    }
    return data;
  }
  List<Family> _getChildren(Family node){
    List<Family> data = node.children.keys.toList();
    for (Family key in node.children.keys){
        if (! data.contains(key)){
            data.addAll(_getChildren(key));
        }  
    }
    return data;
  }
}