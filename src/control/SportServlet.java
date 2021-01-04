package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import dao.OrderDAO;
import dao.UserDao;
import model.Order;
import model.Room;
import model.User;

/**
 * Servlet implementation class SportServlet
 */
@WebServlet("/SportServlet")
public class SportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User)request.getSession().getAttribute("user");
		String message = null;
		if(user==null||"".equals(user)) {	
			JOptionPane.showMessageDialog(null,"请先登录");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/User_Login.jsp");
			rd.forward(request, response);
		}else{
			try{
				String date = request.getParameter("sportdate");
				String start = request.getParameter("sporttimestart");
				String end = request.getParameter("sporttimeend");
				Date DATE = new SimpleDateFormat("yyyy-MM-dd").parse(date);
				Date Start = new SimpleDateFormat("HH:mm").parse(start);
				Date End = new SimpleDateFormat("HH:mm").parse(end);
				if(Start.compareTo(End)==1) {
					message = "开始时间不能晚于结束时间";
					request.getSession().setAttribute("message", message);
					response.sendRedirect(request.getHeader("Referer"));
				}else {
					long time = (End.getTime() - Start.getTime())/(1000*60);
					int h = (int)time/60;
					int m = (int)time%60;
					if(m>=30) h=h+1;
					double price;
					if("vip".equals(user.getStatus())) {
						price = h*20;
					}else {
						price = h*50;
					}
					OrderDAO od = new OrderDAO();
					boolean success = od.addSport(price,user.getUserId(),new java.sql.Date(DATE.getTime()));
		            if(success) {message="预约成功";}
		            else {message = "预约失败!";}
		            request.getSession().setAttribute("message", message);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
					rd.forward(request, response);
				}
				
				}catch(Exception e) {
	 			System.out.println(e);
	 			message = "预约错误!"+e;
				}		
			}	
	}

}
