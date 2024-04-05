
executeGeneric(){
  // Create an object of IntData class
  IntData intData = IntData(10);
  DoubleData doubleData = DoubleData(10.5);
  // Print the data
  print("IntData: ${intData.data}");
  print("DoubleData: ${doubleData.data}");


  // create an object of type int and double
  Data<int> intDataG = Data<int>(10);
  Data<double> doubleDataG = Data<double>(10.5);

  // print the data
  print("IntData: ${intDataG.data}");
  print("DoubleData: ${doubleDataG.data}");
}

// Without Generics
// Creating a class for int
class IntData {
  int data;
  IntData(this.data);
}
// Creating a class for double
class DoubleData {
  double data;
  DoubleData(this.data);
}

// Using Generics
class Data<T> {
  T data;
  Data(this.data);
}
