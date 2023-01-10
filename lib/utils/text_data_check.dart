class CheckData {
  static bool isNotNull(String data) {
    if (data == null) {
      return false;
    }
    return data.trim().isNotEmpty &&
        data.trim() != "" &&
        data.trim() != "undefined";
  }
  // static bool isEmail(String email){
  //   return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  // }
  // static bool isPassword(String password){
  //   return RegExp(r"^[a-zA-Z0-9]{6,}").hasMatch(password);
  // }
  // static bool isName(String name){
  //   return RegExp(r"^[a-zA-Z]{3,}").hasMatch(name);
  // }
  // static bool isPhone(String phone){
  //   return RegExp(r"^[0-9]{10,}").hasMatch(phone);
  // }
  // static bool isAddress(String address){
  //   return RegExp(r"^[a-zA-Z0-9]{3,}").hasMatch(address);
  // }
  // static bool isPincode(String pincode){
  //   return RegExp(r"^[0-9]{6,}").hasMatch(pincode);
  // }
  // static bool isCity(String city){
  //   return RegExp(r"^[a-zA-Z]{3,}").hasMatch(city);
  // }
  // static bool isState(String state){
  //   return RegExp(r"^[a-zA-Z]{3,}").hasMatch(state);
  // }
  // static bool isCountry(String country){
  //   return RegExp(r"^[a-zA-Z]{3,}").hasMatch(country);
  // }

}
