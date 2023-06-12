package com.projects.intro_prog_web_29;

import java.util.Map;
import java.util.HashMap;
// class Aderente per salvare utenti di tipo aderente. E' come simpatizzante ma ha in più delle donazioni
public class Aderente extends Simpatizzante {
  
  Map<String, Float> donations = new HashMap<String, Float>();

  public Aderente(String username) {
    super(username);
  }

  public Aderente(String name, String surname, String birthdate, String email, String phone, String username,
      String password) {
    super(name, surname, birthdate, email, phone, username, password);
  }

}
