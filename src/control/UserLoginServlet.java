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
        //�ж��û���������Ϊ�յ����
        if (request.getParameter("username").equals("") || request.getParameter("password").equals("")) {
            JOptionPane.showMessageDialog(null, "�û��������벻��Ϊ��");
            String message = "<li>��¼ʧ��<>";
            request.setAttribute("result", message);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/User_Login.jsp");
            rd.forward(request, response);
        }

        //�������û�������������
        else {
            UserDao userDao=new UserDao();
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            if(userDao.Login_U(username,password)!=null){
                //����session���д洢
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