package com.projects.intro_prog_web_29.getters;

import com.projects.intro_prog_web_29.Activity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "getActivities", value = "/activities")
public class getActivities extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] titles = new String[]{"Mensa", "2", "3"};

        String preview = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor";

        String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laborLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laborLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut laborLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labor";
        String imageSource = "src/main/webapp/images/placeholder.jpeg";

        Activity a1 = new Activity();
        Activity a2 = new Activity();
        Activity a3 = new Activity();

        this.createActivity(a1,titles[0],preview,description, imageSource);
        this.createActivity(a2,titles[1],preview,description, imageSource);
        this.createActivity(a3,titles[2],preview,description, imageSource);
        request.setAttribute("activity1",a1);
        request.setAttribute("activity2",a2);
        request.setAttribute("activity3",a3);
        RequestDispatcher
                rd=getServletContext().getRequestDispatcher("/activities.jsp");
        rd.forward(request,response);

    }

    public void createActivity(Activity activity, String title, String preview, String description, String imageSource){
        activity.setTitle(title);
        activity.setPreview(preview);
        activity.setDescription(description);
        activity.setImageSource(imageSource);
    }
}
