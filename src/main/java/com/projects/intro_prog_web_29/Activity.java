package com.projects.intro_prog_web_29;

import java.io.Serializable;

public class Activity implements Serializable {
    String title;
    String preview;
    String description;
    String imageSource;

    public Activity(){}

    public void setTitle(String title){
        this.title = title;
    }

    public String getTitle(){
        return title;
    }

    public void setPreview(String preview){
        this.preview = preview;
    }

    public String getPreview(){
        return preview;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getDescription(){
        return description;
    }

    public void setImageSource(String imageSource){
        this.imageSource = imageSource;
    }

    public String getImageSource(){
        return getImageSource();
    }
}