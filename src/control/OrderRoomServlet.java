package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import model.*;

/**
 * Servlet implementation class OrderRoomServlet
 */
@WebServlet("/OrderRoomServlet")
public class OrderRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderRoomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Order order = (Order)request.getSession().getAttribute("order");
		String message = null;
		if(order==null||"".equals(order)){
			message = "请先选择预约信息";
			request.getSession().setAttribute("message", message);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}else {
			int id = Integer.parseInt(request.getParameter("id"));
			RoomDAO dao = new RoomDAO();
			Room room = dao.GetRoomById(id);
			ArrayList<Room> rl;
			if(order.getRoomlist()==null) {
				rl = new ArrayList<Room>();
			}else {
				rl = order.getRoomlist();
			}
			for(Room r:rl) {
				if(r.getRoomid()==id) {
					message = "您已预约该房间";
					request.getSession().setAttribute("message", message);
					break;
				}
			}
			if(message == "您已预约该房间") {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Order.jsp");
				rd.forward(request, response);
			}else {
				rl.add(room);
				order.setRoomlist(rl);
				request.getSession().setAttribute("order", order);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/Order.jsp");
				rd.forward(request, response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
