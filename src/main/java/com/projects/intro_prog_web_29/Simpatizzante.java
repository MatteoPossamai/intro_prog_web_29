package com.projects.intro_prog_web_29;

public class Simpatizzante extends User {
  String activity[] = new String[3];

  public Simpatizzante(String username) {
    super(username);
  }

  public Simpatizzante(String name, String surname, String birthdate, String email, String phone, String username,
      String password) {
    super(name, surname, birthdate, email, phone, username, password);
  }

}
