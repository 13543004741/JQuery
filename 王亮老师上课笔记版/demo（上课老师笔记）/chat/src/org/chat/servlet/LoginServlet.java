package org.chat.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.chat.bean.UserBean;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 608150462346155195L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收用户名
		String userName = request.getParameter("userName");
		UserBean user = new UserBean();
		user.setUserName(userName);
		//将用户保存到会话当中
		request.getSession().setAttribute("user", user);
		//同时将用户添加到用户列表
		//先从上下文中获取用户列表
		List<UserBean> userList = (List<UserBean>)request.getServletContext().getAttribute("userList");
		userList.add(user);
		//重定向到聊天页面
		response.sendRedirect("chat.html");
	}

}
