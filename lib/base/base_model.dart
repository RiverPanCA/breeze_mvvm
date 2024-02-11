class BaseModel {
  BaseModel({String? docId}) {
    if (docId != null) {
      this.docId = docId;
    }
  }

  /// Firebase Firestore
  String docId = 'NotSet';
}
