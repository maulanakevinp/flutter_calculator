class Validation {
  String validateNilai1(String value){
    if (value.isEmpty) {
      return 'Harap isi nilai 1';
    }
    return null;
  }

  String validateNilai2(String value){
    if (value.isEmpty) {
      return 'Harap isi nilai 2';
    }
    return null;
  }
}