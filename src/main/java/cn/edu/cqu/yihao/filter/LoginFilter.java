package cn.edu.cqu.yihao.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("过滤器销毁");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		HttpServletRequest req = (HttpServletRequest) request;
		req.setCharacterEncoding("utf-8");
		HttpServletResponse resp = (HttpServletResponse) response;
		resp.setContentType("text/html;charset=utf-8");
		List<String> list= new ArrayList<String>(); //将不需要过滤的请求存放到集合中
		list.add("index.jsp");
		list.add("/log/login");
		//list.add("/log/login");//跳转至登录页面请求
		list.add("/log/register");//注册页面
		list.add("validate");
		//list.add("/login");//登录页面
		//list.add("/isname");//是否存在用户名请求
		//list.add("/toregister");//跳转到注册页面请求
		String path = req.getServletPath();//得到请求的url
		//循环集合把不需要过滤的请求放行
		for(String l : list){
			if(path.endsWith(l)){
				chain.doFilter(req, resp);
				return;
			}
		}
		//查看session是否存在对象，有对象的话也不需要过滤
		Cookie[] cookies = req.getCookies();//这样便可以获取一个cookie数组
		int flag=0;
		for(Cookie cookie : cookies)
		{
			if(cookie.getName().toString().equals("loginTel"))
			{
				flag=1;
				break;
			}
		}
		if(flag==0){
			//session没有对象就跳转到登录页面
			System.out.println("无用户");
			resp.sendRedirect("/log/login");
		}
		else
		{
			System.out.println("有用户");
			chain.doFilter(req, resp);
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException
	{
		// TODO Auto-generated method stub
		System.out.println("过滤器初始化");
	}

}
