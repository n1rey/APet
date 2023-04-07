package com.ap.member;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberJoin {

	@NotEmpty
	private String username;
	
	@NotEmpty
	private String password;

	private String mname;

	private String mnickname;
	private String mphone;
	
}
