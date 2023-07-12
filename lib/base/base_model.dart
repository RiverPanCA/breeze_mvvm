class BaseModel {
  BaseModel({String? docId}) {
    if (docId != null) {
      this.docId = docId;
    }
  }

  String docId = 'NotSet';
}
