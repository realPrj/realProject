package icia.project.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.web.servlet.ModelAndView;

import icia.project.bean.MemberBean;
import icia.project.bean.LearningRoomBean;
import icia.project.dao.IMybatis;
import icia.project.dao.TransactionExe;
import icia.project.key.Encryption;



@Service
public class teacherManagement extends TransactionExe {

	@Autowired
	private IMybatis dao;
	@Autowired
	private ProjectUtils session;
	@Autowired
	private Encryption enc;

	private ModelAndView mav;

	public ModelAndView entrance(int serviceCode,Object object) {

		switch(serviceCode) {

		case 1:	// 로그인
			mav = login(((MemberBean)object));
			break;

		case 2 : // 회원가입
			mav = join(((MemberBean)object));
			break;

		case 3 : // 아이디 중복체크	
			mav = idRedundancyCheck(((MemberBean)object));
			break;

		case 4:	// 아이디 찾기	
			mav = idFind(((MemberBean)object));

		case 5:	// 로그아웃
			mav = logout();
			break;

		case 6:	// 나의 정보 수정
			mav = lnformationChange(((MemberBean)object));
			break;

		case 7:	// 회원탈퇴
			mav = memberDelete();
			break;

		case 8:	// 학습방 개설
			mav = learningOpen(((LearningRoomBean)object));
			break;

		}

		return mav;

	}

	private ModelAndView login(MemberBean member) {	// 로그인

		mav = new ModelAndView();

		boolean transaction = false;
		String page = null;

		setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {

			if(dao.tcIdCheck(member) != 0) {	// 아이디 체크
				
				if(enc.matches(member.getPwd(),dao.tcPwdGet(member).getPwd())) {	// 비밀번호 체크
					member.setLogType(1);
					
					/*if(dao.tcLogHistory(member) != 0) {	// 로그히스토리
*/						
						// 동적으로 학습방 쏴주기

						session.setAttribute("tcId", member.getId());
						session.setAttribute("identity", member.getIdentity());
						page ="teacherMain";
						transaction = true;
				/*	}else {
						page = "login";
						mav.addObject("identity", "1");
						mav.addObject("message", "alert('로그인 실패 하셨습니다.')");
						mav.addObject("id", member.getId());
					}
*/
				}else {
					page = "login";
					mav.addObject("identity", "1");
					mav.addObject("message", "alert('비밀번호가 틀렸습니다.')");
					mav.addObject("id", member.getId());
				}

			}else {
				page = "login";
				mav.addObject("identity", "1");
				mav.addObject("message", "alert('아이디가 틀렸습니다.')");
				mav.addObject("id", member.getId());
			}

		}catch(Exception ex) {
			System.out.println("여기옴");
		}finally {
			mav.setViewName(page);
			setTransactionResult(transaction);
		}

		return mav;
	}

	private ModelAndView join(MemberBean member) {	// 회원가입

		mav = new ModelAndView();

		boolean transaction = false;
		String page = null;

		setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {

			if(dao.tcIdCheck(member) == 0) {	// 아이디 체크
				member.setPwd(enc.encode(member.getPwd()));	// 보안비밀번호

				if(dao.tcJoin(member) != 0) {	// 인설트

					page ="login";
					mav.addObject("identity", "1");
					transaction = true;

				}else {

					page = "teacherjoin";
					mav.addObject("id", member.getId());
					mav.addObject("name", member.getName());
					mav.addObject("email", member.getEmail());
					mav.addObject("phone", member.getPhone());
					mav.addObject("identity", "1");
					mav.addObject("message", "alert('회원가입 실패 하셨습니다.')");

				}

			}else {
				page = "teacherjoin";
				mav.addObject("id", member.getId());
				mav.addObject("name", member.getName());
				mav.addObject("email", member.getEmail());
				mav.addObject("phone", member.getPhone());
				mav.addObject("identity", "1");
				mav.addObject("message", "alert('사용하실 수 없는 아이디입니다.')");
			}

		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
			setTransactionResult(transaction);
		}

		return mav;
	}

	private ModelAndView idRedundancyCheck(MemberBean member) {	// 아이디 중복체크

		mav = new ModelAndView();

		String page = null;

		try {

			if(dao.tcIdCheck(member) != 0) {	// 아이디 체크
				page = "teacherjoin";
				mav.addObject("id", member.getId());
				mav.addObject("identity", "1");
				mav.addObject("message", "alert('사용하실 수 없는 아이디입니다.')");

			}else {
				page = "teacherjoin";
				mav.addObject("id", member.getId());
				mav.addObject("identity", "1");
				mav.addObject("message", "alert('사용하실 수 있는 아이디입니다.')");
			}

		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
		}

		return mav;
	}	

	private ModelAndView idFind(MemberBean member) {	// 아이디 찾기

		mav = new ModelAndView();

		String page = null;
		MemberBean mb;

		try {

			mb = dao.tcIdFind(member);

			if(mb.getId().equals(null)) {
				page = "login";
				mav.addObject("identity", "1");
				mav.addObject("message", "alert('아이디가 없습니다.')");
			}else {
				page = "login";
				mav.addObject("identity", "1");
				mav.addObject("message", "alert('"+mb.getId()+"')");
			}



		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
		}

		return mav;
	}

	private ModelAndView logout() {	// 로그아웃

		mav = new ModelAndView();

		boolean transaction = false;
		String page = null;
		MemberBean member = new MemberBean();

		setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {

			member.setId((String)session.getAttribute("tcId"));

			member.setLogType(-1);

			if(dao.tcLogHistory(member) != 0) {
				session.removeAttribute("tcId");
				session.removeAttribute("identity");
				page = "home";
				mav.addObject("message", "alert('로그아웃 되셨습니다.')");
				transaction = true;
			}else {
				session.removeAttribute("tcId");
				session.removeAttribute("identity");
				page = "home";
				mav.addObject("message", "alert('로그아웃 실패하셨습니다.')");
				transaction = true;
			}

		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
			setTransactionResult(transaction);
		}

		return mav;
	}

	private ModelAndView lnformationChange(MemberBean member) {	// 나의 정보 수정

		mav = new ModelAndView();

		boolean transaction = false;
		String page = null;

		setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {
			member.setId((String)session.getAttribute("tcId"));
			member.setPwd(enc.encode(member.getPwd()));	// 보안비밀번호

			if(dao.tcInformationChange(member) != 0) {
				page = null;
				mav.addObject("message", "alert('나의 정보 수정 되었습니다.')");
				transaction = true;
			}else {
				page = null;
				mav.addObject("message", "alert('나의 정보 수정 실패 되셨습니다.')");
			}


		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
			setTransactionResult(transaction);
		}

		return mav;
	}

	private ModelAndView memberDelete() {	// 회원탈퇴

		mav = new ModelAndView();

		boolean transaction = false;
		String page = null;
		MemberBean member = new MemberBean();

		setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {
			member.setId((String)session.getAttribute("tcId"));

			if(dao.tcmemberDelete(member) != 0) {

				// 다른 테이블도 delete 시켜줘야함

				session.removeAttribute("tcId");
				session.removeAttribute("identity");
				page = "home";
				mav.addObject("message", "alert('회원탈퇴 되셨습니다.')");
				transaction = true;
			}else {
				session.removeAttribute("tcId");
				session.removeAttribute("identity");
				page = "home";
				mav.addObject("message", "alert('회원탈퇴 실패하셨습니다.')");
				transaction = true;
			}


		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
			setTransactionResult(transaction);
		}

		return mav;
	}

	private ModelAndView learningOpen(LearningRoomBean room) {	// 학습방 개설

		mav = new ModelAndView();

		boolean distinction = true;
		boolean transaction = false;
		String page = null;
		int code = 0; 

		setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {

			while(distinction) {	// 학습코드 유무 체크

				code = (int)(Math.random() *1000);

				room.setRoomCode(Integer.toString(code));

				if(dao.tclearningCodeCheck(room) == 0) {				
					distinction = false;				
				}else {
					distinction = true;
				}

			}

			room.setId((String)session.getAttribute("tcId"));
		
			if(dao.tclearningOpen(room) != 0) {
				page = "teacherMain";
				mav.addObject("message", "alert('학습방 개설 되셨습니다.')");

				// 과목 복사해야됨

			}else {
				page = "teacherMain";
				mav.addObject("message", "alert('학습방 개설 실패 되셨습니다.')");
			}

		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
			setTransactionResult(transaction);
		}

		return mav;
	}

}
