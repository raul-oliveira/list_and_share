abstract class LogginAttrsModel {
  DateTime creationDate;
  String createdBy;
  DateTime lastChangeDate;
  String lastChangeBy;
  
  LogginAttrsModel({
    this.creationDate,
    this.createdBy,
    this.lastChangeDate,
    this.lastChangeBy,
  });

  @override
  String toString() {
    return 'LogginAttrsModel(creationDate: $creationDate, createdBy: $createdBy, lastChangeDate: $lastChangeDate, lastChangeBy: $lastChangeBy)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LogginAttrsModel &&
        o.creationDate == creationDate &&
        o.createdBy == createdBy &&
        o.lastChangeDate == lastChangeDate &&
        o.lastChangeBy == lastChangeBy;
  }

  @override
  int get hashCode {
    return creationDate.hashCode ^
        createdBy.hashCode ^
        lastChangeDate.hashCode ^
        lastChangeBy.hashCode;
  }
}
