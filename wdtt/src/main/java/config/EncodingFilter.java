package config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * 필터 : 요청에 앞서 처리되는 코드
 * 로깅(log)자료를 남기기 위해 사용, 해킹, 접속정보, 자료수정정보 등
 * url pattern : /* (모든요청)
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {
       private String charset="utf-8";
   

	public void destroy() {//필터 제거(서버가 멈출때)
		System.out.println("필터가 제거되었습니다.");
	}

	//요청이 들어올때 거치는 코드
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("필터가 실행되었습니다.");
		request.setCharacterEncoding(charset);
		chain.doFilter(request, response);//여기서 실제 처리
	}


}
