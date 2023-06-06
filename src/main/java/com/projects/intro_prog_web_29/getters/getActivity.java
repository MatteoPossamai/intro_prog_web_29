package com.projects.intro_prog_web_29.getters;

import com.projects.intro_prog_web_29.Activity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "getActivity", value = "/getActivity")
public class getActivity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activityID = request.getParameter("activityID");
        System.out.println(activityID);
        Activity activity = new Activity();

        if(activityID.equals("1")){
                    createActivity(activity,"Mensa", "asd", "asd", "");
        } else if(activityID.equals("2") ){
            createActivity(activity,"2", "asd", "asd", "");
        } else if (activityID.equals("3")){
            createActivity(activity,"3", "asd", "asd", "");
        }


        request.setAttribute("activity",activity);


        request.getRequestDispatcher("/activity.jsp").forward(request,response);


    }

    public void createActivity(Activity activity, String title, String preview, String description, String imageSource){
        activity.setTitle(title);
        activity.setPreview(preview);
        activity.setDescription(description);
        activity.setImageSource(imageSource);
    }

}
