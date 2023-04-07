package com.ap.member;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class ModMember{

    @NotBlank(message = "아이디를 입력해주세요")
    @Email(message = "이메일 형식이여야 합니다.")
    private String username;
	
    @NotBlank(message = "이름을 입력해주세요")
    private String mname;

    @NotBlank(message = "닉네임을 입력해주세요")
    private String mnickname;

    @NotBlank(message = "휴대폰번호를 입력해주세요.")
    private String mphone;

}
