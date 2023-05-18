package com.projects.intro_prog_web_29;

import java.util.HashMap;
import java.util.Map;

public class AuthBasic {
    public static Map<String, String> redirect_pages  = new HashMap<String, String>() {{
        put("AM", "/amministratore.jsp");
        put("SI", "/simpatizzante.jsp");
        put("AD", "/aderente.jsp");
    }};
}
