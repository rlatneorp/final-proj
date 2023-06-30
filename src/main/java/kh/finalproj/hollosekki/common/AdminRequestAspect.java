package kh.finalproj.hollosekki.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.finalproj.hollosekki.admin.model.vo.AdminBasic;


@Component
@Aspect
public class AdminRequestAspect {
	
	@Around("execution(* kh.finalproj.hollosekki.admin.controller.AdminController.*(..))")
	public Object adminRequestBasic(ProceedingJoinPoint joinPoint) throws Throwable {
//		aop 목적
//		1) 매번 모델에 담을 필요 없애주기 ( aop에서 around의 proceed 이전에 값 세팅, 이후에 setAttribute하기 )
		
		System.out.println("-------------------------------------------------------aop시작------------------------------------------------");
//		┌ AOP가 적용될 메소드의 정보
		Signature signature = joinPoint.getSignature();
//		┌ 패키지를 포함한 클래스명
		String type2 = signature.getDeclaringTypeName();
//		┌ 해당 메소드의 이름
		String methodName = signature.getName();
		
		String componentName = "";
		if(type2.indexOf("controller") > -1) {
			componentName = "Controller \t: ";
		}else if(type2.indexOf("Service") > -1 ) {
			componentName = "ServiceImpl \t: ";
		}else if(type2.indexOf("DAO") > -1) {
			componentName = "DAO \t\t: ";
		}
		System.out.println("[start] " + componentName + type2 + "." + methodName + "()");
		
//		2가지 경우로 나누어 진행
//		1) enctype="multipart/form-data"
//			-> MultipartHttpServletRequest 로 값 가져오기
//		2) 1)이 아닐경우
//			-> Request 로 값 가져오기
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		for(Object obj : joinPoint.getArgs()) {
			if (obj instanceof MultipartHttpServletRequest) {
				request = (MultipartHttpServletRequest) obj;
			}
		}
		HttpSession session = request.getSession();
		
		AdminBasic ab = new AdminBasic();
		
		if(request.getParameter("searchStart") != null || request.getParameter("pageCountStart") != null || request.getParameter("page") == null) {
			ab.setPage(1);
		}else {
			ab.setPage(Integer.parseInt(request.getParameter("page")));
		}
		
//		session 값 x / request 값 x
		if(session.getAttribute("pageCount") == null && request.getParameter("pageCount") == null) {
			session.setAttribute("pageCount", 10);
			ab.setPageCount(10);
//		session 값 o / request 값 x
		}else if(session.getAttribute("pageCount") != null && request.getParameter("pageCount") == null){
//			ab.setPageCount(Integer.parseInt(session.getAttribute("pageCount").toString()));
			ab.setPageCount((int)session.getAttribute("pageCount"));
//		session 값 o / request 값 o
		}else {
			ab.setPageCount(Integer.parseInt(request.getParameter("pageCount")));
			session.setAttribute("pageCount", Integer.parseInt(request.getParameter("pageCount")));
		}
	
		ab.setSearchType(request.getParameter("searchType"));
		ab.setSearchText(request.getParameter("searchText"));
		if(request.getParameter("type") != null && request.getParameter("type").trim() != "") {
			ab.setType(Integer.parseInt(request.getParameter("type")));
		}
		if(request.getParameter("kind") != null && request.getParameter("kind").trim() != "") {
			ab.setKind(Integer.parseInt(request.getParameter("kind")));
		}
		
		
		request.setAttribute("ab", ab);
		
		System.out.println("[Before] " + componentName + type2 + "." + methodName + "()");		
		Object result = joinPoint.proceed();
		System.out.println("[After] " + componentName + type2 + "." + methodName + "()");

		HttpServletRequest requestAfter = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		requestAfter.setAttribute("ab", ab);
		
		System.out.println("[end] " + componentName + type2 + "." + methodName + "()");
		return result;
	}
}

