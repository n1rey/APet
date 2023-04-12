package com.ap.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;

public class SecurityInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            // 인증 정보가 있을 경우 모델에 담는다
            request.setAttribute("username", auth.getName());
        }
        
        return true;
    }

}