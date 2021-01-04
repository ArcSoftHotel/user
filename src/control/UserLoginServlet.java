package control;

import dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.IOException;

@WebServlet("/UserLogin")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //判断用户名和密码为空的情况
        if (request.getParameter("username").equals("") || request.getParameter("password").equals("")) {
            JOptionPane.showMessageDialog(null, "用户名或密码不能为空");
            String message = "<li>登录失败<>";
            request.setAttribute("result", message);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/User_Login.jsp");
            rd.forward(request, response);
        }

        //已输入用户名和密码的情况
        else {
            UserDao userDao=new UserDao();
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            if(userDao.Login_U(username,password)!=null){
                //利用session进行存储
                HttpSession session=request.getSession();
                synchronized(session)
                {
                    session.setAttribute("user",userDao.Login_U(username,password));
                }
                response.sendRedirect("index.jsp");
            }
        }
    }
}