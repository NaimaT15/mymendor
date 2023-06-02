class LoginModel {
  String id;
  String password;
  LoginModel(this.id, this.password);
  toJson() {
    return {"id": this.id, "password": this.password};
  }
}
