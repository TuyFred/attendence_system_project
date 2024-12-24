package com.attendence;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SendEmailServlet")
public class SendEmailServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form parameters
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");

        // Send the email
        try {
            emailUtils.sendEmail(to, subject, body);
            response.getWriter().println("Email sent successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Failed to send email. Please try again.");
        }
    }
}
