class MyUser{
  static const String collectionName="my_user";
  String? id;
  String? email;
  String? name;

  MyUser({
    required this.id,
    required this.name,
    required this.email
});

MyUser.fromFireStore(Map<String,dynamic> data):this(
  id: data["id"],
  name: data["name"],
  email: data["email"]
);

 Map<String,dynamic> toFireStore(){

   return {
     "id":id,
     "name":name,
     "email":email
   };
  }



}