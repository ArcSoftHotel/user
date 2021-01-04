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

import dao.*;
import model.*;
/**
 * Servlet implementation class CommitOrderServlet
 */
@WebServlet("/CommitOrderServlet")
public class CommitOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommitOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Room> roomlist = (ArrayList<Room>)request.getSession().getAttribute("roomlist");
		Order order = new Order();
		User user = (User)request.getSession().getAttribute("user");
		String message = null;
		if(user==null||"".equals(user)) {	
			JOptionPane.showMessageDialog(null,"请先登录");
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/User_Login.jsp");
			rd.forward(request, response);
		}else if(roomlist==null||"".equals(roomlist)){
			message = "请先选择房间";
			request.getSession().setAttribute("message", message);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Order.jsp");
			rd.forward(request, response);
		} else{
			try{
				String checkin = request.getParameter("checkIn");
				String checkout = request.getParameter("checkOut");
				int adult = Integer.parseInt(request.getParameter("selectAdult"));
				int child = Integer.parseInt(request.getParameter("selectChild"));
				Date checkIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin);
				Date checkOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout);
				if(checkIn.compareTo(checkOut)==1) {
					message = "入住时间不能晚于退房时间";
					request.getSession().setAttribute("message", message);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Order.jsp");
					rd.forward(request, response);
				}
				order.setAdult(adult);
				order.setCheckIn(checkIn);
				order.setCheckOut(checkOut);
				order.setChild(child);
				ArrayList<Room> rl = new ArrayList<Room>();
				String []roombox = request.getParameterValues("roombox");
				for(String r:roombox) {
					int id = Integer.parseInt(r);
					for(Room room:roomlist) {
						if(room.getRoomid()==id) {
							rl.add(room);
						}
					}
				}
				order.setRoomlist(rl);
				OrderDAO od = new OrderDAO();
				boolean success = od.addOrder(order,user.getUserId());
				UserDao ud = new UserDao();
				boolean success2;
				if(ud.finduserconsume(user.getUserId())) {
					success2 = od.updateConsume(order, user.getUserId());
				}else {
					success2 = od.addConsume(order, user.getUserId());
				}
	            if(success&&success2) {message="预约成功";}
	            else {message = "预约失败!";}
				}catch(Exception e) {
	 			System.out.println(e);
	 			message = "预约错误!"+e;
	 		}		
	        request.getSession().setAttribute("message", message);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			}		
	}
}
