package kh.finalproj.hollosekki.common;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
@Aspect
public class AdminRequestAspect {
	
	@Around("execution(* kh.finalproj.hollosekki..*(..))")
	public Object adminRequestBasic(ProceedingJoinPoint joinPoint) throws Throwable {
		
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		
		System.out.println("aop시작");
//		request.getAttribute("")
		Object obj = joinPoint.proceed();
		
		System.out.println("aop종료");
		return obj;
	}
}
