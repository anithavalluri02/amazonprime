package com.amazonprime.app;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class PrimeApp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        resp.getWriter().println("<h1>Welcome to Amazon Prime Clone 🚀</h1>");
    }
}

