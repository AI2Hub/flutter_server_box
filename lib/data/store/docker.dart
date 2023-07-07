import 'package:toolbox/core/persistant_store.dart';

class DockerStore extends PersistentStore {
  String? getDockerHost(String id) {
    return box.get(id);
  }

  void setDockerHost(String id, String host) {
    box.put(id, host);
  }

  Map<String, String> fetch() {
    return box.toMap().cast<String, String>();
  }
}

final dockerStore = DockerStore();
