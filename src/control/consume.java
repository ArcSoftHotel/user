package control;

import dao.UserDao;
import model.*;
import java.io.*;

import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.*;
import java.util.Date;

@WebServlet("/consume")
public class consume extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
		String errmsg = "";
		
		User u = (User)request.getSession().getAttribute("user");
		if(u==null||"".equals(u)){
			JOptionPane.showMessageDialog(null,"请先登录");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/User_Login.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
		String userId = u.getUserId();
		double amount =Double.parseDouble( request.getParameter("amount"));
		try {
			UserDao userDao=new UserDao();
			if(userDao.finduserconsume(userId)) {
				if(userDao.among(userId,amount))
				{
					errmsg = "成功！";
					JOptionPane.showMessageDialog(null,"添加成功");
				}else{
					JOptionPane.showMessageDialog(null,"添加失败");
				}
			}else {
				if(userDao.addmoney(userId,amount))
				{
					errmsg = "成功！";
					JOptionPane.showMessageDialog(null,"插入成功");
				}else{
					JOptionPane.showMessageDialog(null,"插入失败");
				}
			}
			request.setAttribute("errmsg", errmsg);
			request.getRequestDispatcher("/User_ShoppingCart.jsp").forward(request,
					response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	  }
	}
}
