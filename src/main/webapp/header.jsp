<%
    HttpSession Session = request.getSession(false);
    if (session == null || session.getAttribute("adminUsername") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!-- Your existing header/sidebar HTML goes here -->
