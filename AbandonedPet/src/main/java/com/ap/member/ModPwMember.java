package com.ap.member;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class ModPwMember {

    @NotBlank(message = "아이디를 입력해주세요")
    @Email(message = "이메일 형식이여야 합니다.")
    private String username;
    
    @Size(min = 8, max = 20, message = "비밀번호는 8~20자 사이이여야 합니다.")
    private String password;
    
    private String passwordConfirm;
	
}
