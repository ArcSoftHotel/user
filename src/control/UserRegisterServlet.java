package control;

import dao.UserDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;

@WebServlet("/UserRegister")
public class UserRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDao userDao=new UserDao();
        String message=null; //反馈信息

        //判断填写栏是否为空
        if(request.getParameter("username").equals("")||
                request.getParameter("password").equals("")||
                request.getParameter("repassword").equals("")||
                request.getParameter("name").equals("")||
                request.getParameter("phone").equals("")||request.getParameter("document_number").equals("")) {
            JOptionPane.showMessageDialog(null, "输入信息不能为空");
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/User_Register.jsp");
            rd.forward(request, response);
        }else{

            //从form表单中取值
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String repassword=request.getParameter("repassword");
            String name=request.getParameter("name");
            String phone=request.getParameter("phone");
            String documentnumber=request.getParameter("document_number");

            //进行密码判断
            if(password.equals(repassword)){
                boolean success=userDao.add(username,password,name,phone,documentnumber);
                if(success){
                    JOptionPane.showMessageDialog(null, "插入成功");
                    message="<li>插入成功</li>";
                    response.sendRedirect("/User_Login.jsp");
                }else{
                    JOptionPane.showMessageDialog(null, "失败");
                    message="<li>插入失败</li>";
                    response.sendRedirect("/User_Register.jsp");
                }
            }else{
                JOptionPane.showMessageDialog(null, "两次密码输入不一致");
                response.sendRedirect("/User_Register.jsp");
            }
        }
    }
}
