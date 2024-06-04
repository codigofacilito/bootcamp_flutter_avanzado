class Validate{
  Map data;
  Validate(this.data);

  checkKeyExists({String key ="", var initialize}){
    return (data.containsKey(key) && data[key]!=null)?data[key]:initialize;
  }
}