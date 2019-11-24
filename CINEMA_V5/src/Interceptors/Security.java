package Interceptors;

public class Security  {
	

	

	
}
//public class Security extends HandlerInterceptorAdapter {
//	
//	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		System.out.println("logger prehandler!");
//		HttpSession session = request.getSession();
//		if(session.getAttribute("userLoginAD") == null) {
//			response.sendRedirect(request.getContextPath()+ "admin");
//			return false;
//		}
//		return true;
//	}
//	
//
//	
//}
