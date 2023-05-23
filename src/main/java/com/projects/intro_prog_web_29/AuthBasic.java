package com.projects.intro_prog_web_29;

import java.util.HashMap;
import java.util.Map;

public class AuthBasic {
    // This map is used to redirect the user to the correct page after the login
    // It has been put in a different file to avoid code duplication
    public static Map<String, String> redirect_pages  = new HashMap<String, String>() {{
        put("AM", "/amministratore.jsp");
        put("SI", "/simpatizzante.jsp");
        put("AD", "/aderente.jsp");
    }};
}
