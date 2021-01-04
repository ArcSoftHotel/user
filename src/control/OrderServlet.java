package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import model.*;
/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		Order order = new Order();
		String message = null;
		try {
			if(request.getParameter("checkIn").equals("") ||request.getParameter("checkOut").equals("")) {
				message = "请选择入住或退房时间";
				request.getSession().setAttribute("message", message);
				response.sendRedirect(request.getHeader("Referer"));			
			}else {
					String checkin = request.getParameter("checkIn");
					String checkout = request.getParameter("checkOut");
					int adult = Integer.parseInt(request.getParameter("selectAdult"));
					int child = Integer.parseInt(request.getParameter("selectChild"));
					Date checkIn = new SimpleDateFormat("MM/dd/yyyy").parse(checkin);
					Date checkOut = new SimpleDateFormat("MM/dd/yyyy").parse(checkout);
					if(checkIn.compareTo(checkOut)==1) {
						message = "入住时间不能晚于退房时间";
						request.getSession().setAttribute("message", message);
						response.sendRedirect(request.getHeader("Referer"));
					}
					order.setAdult(adult);
					order.setChild(child);
					order.setCheckIn(checkIn);
					order.setCheckOut(checkOut);
					request.getSession().setAttribute("order", order);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Order.jsp");
					rd.forward(request, response);
				}
		}catch(Exception e) {
			System.out.println(e);
		}	
	}

}
