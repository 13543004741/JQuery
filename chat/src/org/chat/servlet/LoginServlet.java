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
		//�����û���
		String userName = request.getParameter("userName");
		UserBean user = new UserBean();
		user.setUserName(userName);
		System.out.println(userName);
		//���û����浽�Ự����
		request.getSession().setAttribute("user", user);
		//ͬʱ���û����ӵ��û��б�
		//�ȴ��������л�ȡ�û��б�
		@SuppressWarnings("unchecked")
		List<UserBean> userList = (List<UserBean>)request.getServletContext().getAttribute("userList");
		userList.add(user);
		//�ض�������ҳ��
		response.sendRedirect("html/serviceChat.jsp");
	}

}