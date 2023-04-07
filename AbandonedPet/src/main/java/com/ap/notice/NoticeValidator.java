package com.ap.notice;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class NoticeValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Notice.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Notice notice = (Notice) target;
		
		String ntitle = notice.getNtitle();
		String ncontent = notice.getNcontent();
		
		if(ntitle == null || "".equals(ntitle.trim())) {
			errors.rejectValue("ntitle", "제목을 입력해주세요.");
		}
		
		if(ncontent == null || "".equals(ncontent.trim())) {
			errors.rejectValue("ncontent", "내용을 입력해주세요.");
		}

	}

}
