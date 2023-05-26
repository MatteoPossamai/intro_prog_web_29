package com.projects.intro_prog_web_29;

import java.io.Serializable;

public class VisitCounter implements Serializable {
    int count = 0;
    public void increase() {
        count++;
    }
    @Override
    public String toString() {
        StringBuffer s = null;
        if (count == 0)
            s = new StringBuffer("<p>no hits yet</p>");
        else {
            s = new StringBuffer("<p>hits = ");
        }
        return s.toString();
    }
}