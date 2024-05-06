import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_sample/models/todo.dart';

class TodoRepository {
  final FirebaseFirestore _firebaseFirestore;

  TodoRepository(this._firebaseFirestore);

  Future<void> add(String title, String description) async {
    await _firebaseFirestore.collection('todos').add({
      'title': title,
      'description': description,
      'done': false,
    });
  }

  Future<void> delete(String id) async {
    await _firebaseFirestore.collection('todos').doc(id).delete();
  }

  Future<void> setDone(String id, bool done) async {
    await _firebaseFirestore.collection('todos').doc(id).set({
      'done': done,
    }, SetOptions(merge: true));
  }

  Stream<List<Todo>> todos() {
    return _firebaseFirestore.collection('todos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Todo(
          id: doc.id,
          title: data['title'],
          description: data['description'],
          done: data['done'],
        );
      }).toList();
    });
  }
}
