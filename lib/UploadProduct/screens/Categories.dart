

class Categories
{
    late String _id="";
   late String _categoryName="";

    String get id => _id;

  set id(String value) {
    _id = value;
  }

    String get categoryName => _categoryName;



  set categoryName(String value) {
    _categoryName = value;
  }

  Categories(String categoryName)
  {
    this.categoryName=categoryName;
  }
//
   // String get id=>_id;
   // String get categoryName =>_categoryName;



  //
  // Categories(String id,String name)
  //  {
  //    this.id=id;
  //    this.categoryName=categoryName;
  //  }
  //
}