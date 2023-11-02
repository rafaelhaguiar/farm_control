abstract interface class StorageInterface {
  Future save();
  Future get();
  Future delete();
  Future update();
}

final class StorageImpl implements StorageInterface {
  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future save() {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
