package com.ap.mail;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.util.Base64;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GoogleMailServiceImpl implements MailService {

	private final JavaMailSender mailSender;
	
	@Async
	public void sendMailForPw(String to, String tempPw) {
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("davidgeun@gmail.com", "유기동물 커뮤니티 인증센터");
			messageHelper.setSubject("유기동물 커뮤니티 임시 비밀번호입니다.");
			messageHelper.setTo(to);
			messageHelper.setText("임시 비밀번호는 [ " + tempPw + " ] 입니다." );
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
