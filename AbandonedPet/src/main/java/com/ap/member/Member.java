package com.ap.member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

    private int mid;

    @NotBlank(message = "아이디를 입력해주세요")
    @Email(message = "이메일 형식이여야 합니다.")
    private String username;
    
    @Size(min = 8, message = "비밀번호는 8자 이상이여야 합니다.")
    private String password;
    private String authority;

    @NotBlank(message = "이름을 입력해주세요")
    private String mname;

    @NotBlank(message = "닉네임을 입력해주세요")
    private String mnickname;

    @NotBlank(message = "휴대폰번호를 입력해주세요.")
    private String mphone;

    private String mdate;

}
