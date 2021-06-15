class Family {

  String name;
  int id;
  Map<Family,bool> parents = {};
  Map<Family,bool> children = {};

  Family(int id,String name){
    this.id  = id;
    this.name = name;
  }

  void setName(String name){
    this.name = name;
  }
  void setId(int id){
    this.id = id;
  }
  void addParent(Family parent){
    this.parents[parent] = true;
    
  }
  void addChildren(Family child){
    this.children[child] = true;
  }

  String getName(){
    return this.name;
  }
  int getId(){
    return this.id;
  }
  List<Family> getParent(){
    return this.parents.keys;
  }
  List<Family> getChild(){
    return this.children.keys;
  }
    
}