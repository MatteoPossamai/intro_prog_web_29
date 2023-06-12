package com.projects.intro_prog_web_29;

import java.util.Objects;

public class User {
  // This class is used to store the user data
  String name;
  String surname;
  String birthdate;
  String email;
  String phone;
  String username;
  String password;

  public User(String username) {
    // Constructor
    this.username = username;
  }

  public User(String name, String surname, String birthdate, String email, String phone, String username, String password) {
    // Constructor
    this.name = name;
    this.surname = surname;
    this.birthdate = birthdate;
    this.email = email;
    this.phone = phone;
    this.username = username;
    this.password = password;
  }
  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    User user = (User) o;
    return Objects.equals(username, user.username);
  }

  @Override
  public int hashCode() {
    return Objects.hash(username);
  }
}
