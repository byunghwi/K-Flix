package com.kflix.member.service;

import java.util.Date;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kflix.member.dao.MemberDao;
import com.kflix.member.domain.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDao memberDao;
	
	@Override
	public int register(Member member) {
		return memberDao.register(member);
	}

	@Override
	public Member login(Member member) {
		
		return memberDao.login(member);
	}

	@Override
	public void keepLogin(String email, String session_id, Date next) {
		memberDao.keepLogin(email, session_id, next);
		
	}

	@Override
	public Member checkLoginBefore(String value) {
		
		return memberDao.checkMemWithSessionKey(value);
	}

	@Override
	public int checkEmail(String email) {
		return memberDao.checkEmail(email);
	}

	@Override
	public int updateAuthStatus(String email) {
		return memberDao.emailAuth(email);
	}

	@Override
	public Member getMemberByEmail(String email) {
		return memberDao.getMemberByEmail(email);
	}

}
