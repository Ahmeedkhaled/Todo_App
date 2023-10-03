import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/tasks.dart';

class FirebaseUtils {
  static CollectionReference<Tasks> getTasksCollection(){
   return FirebaseFirestore.instance.collection(Tasks.collectionName)
       .withConverter<Tasks>(
        fromFirestore: (snapShot, options) =>
            Tasks.fromFireStore(snapShot.data()!),
        toFirestore:(tasks,options)=>tasks.toFireStore());
  }
  static Future<void> addTaskToFirebase(Tasks tasks) {
   var collection= getTasksCollection();
  var docRef= collection.doc();
  tasks.id=docRef.id;
  return docRef.set(tasks);
  }
}
