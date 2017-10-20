package icia.project.services;

import java.util.ArrayList;

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
public class StudentManagement extends TransactionExe {

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

		case 2: // 회원가입
			mav = join(((MemberBean)object));
			break;

		case 3: // 아이디 중복체크
			mav = idRedundancyCheck(((MemberBean)object));
			break;

		case 4:	// 아이디 찾기
			mav = idFind(((MemberBean)object));
			break;

		case 5:	// 로그아웃
			mav = logout();
			break;

		case 6:	// 나의 정보 수정
			mav = lnformationChange(((MemberBean)object));
			break;

		case 7:	// 회원탈퇴
			mav = memberDelete();
			break;

		case 8:	// 학습방 참여 및 조회
			mav = learningJoin(((LearningRoomBean)object));
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

			if(dao.stIdCheck(member) != 0) {	// 아이디 체크

				if(enc.matches(member.getPwd(),dao.tcPwdGet(member).getPwd())) {	// 비밀번호 체크	
					member.setLogType(1);
					member = dao.stCodeGet(member);	// 학생코드 추출

					/*if(dao.stLogHistory(member) != 0) {	// 로그히스토리
					 */
					// 동적으로 학습방 쏴주기

					session.setAttribute("stCode", member.getStudentCode());
					session.setAttribute("identity", member.getIdentity());
					page ="studentMain";
					transaction = true;
					/*	}else {
						page = "login";
						mav.addObject("identity", "2");
						mav.addObject("message", "alert('로그인 실패 하셨습니다.')");
						mav.addObject("id", member.getId());
					}*/

				}else {
					page = "login";
					mav.addObject("identity", "2");
					mav.addObject("message", "alert('비밀번호가 틀렸습니다.')");
					mav.addObject("id", member.getId());
				}

			}else {
				page = "login";
				mav.addObject("identity", "2");
				mav.addObject("message", "alert('아이디가 틀렸습니다.')");
				mav.addObject("id", member.getId());
			}

		}catch(Exception ex) {

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


			if(dao.stIdCheck(member) == 0) {	// 아이디 체크
				member.setPwd(enc.encode(member.getPwd()));	// 보안비밀번호
				member.setStateCode("1");

				if(dao.stCodeCheck(member) != 0) {	// 학생코드 유무
					
					if(dao.stJoin(member) != 0) {	// 인설트

						page ="login";
						mav.addObject("identity", "2");
						transaction = true;

					}else {

						page = "studentjoin";
						mav.addObject("id", member.getId());
						mav.addObject("name", member.getName());
						mav.addObject("email", member.getEmail());
						mav.addObject("phone", member.getPhone());
						mav.addObject("identity", "2");
						mav.addObject("message", "alert('회원가입 실패 하셨습니다.')");

					}
					
				}else {	// 학생코드 있음
					page ="login";
					mav.addObject("identity", "2");
					mav.addObject("message", "alert('이미 존재하는 회원입니다.')");
				}

			}else {
				page = "studentjoin";
				mav.addObject("id", member.getId());
				mav.addObject("name", member.getName());
				mav.addObject("email", member.getEmail());
				mav.addObject("phone", member.getPhone());
				mav.addObject("identity", "2");
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

			if(dao.stIdCheck(member) != 0) {	// 아이디 체크
				page = "studentjoin";
				mav.addObject("id", member.getId());
				mav.addObject("identity", "2");
				mav.addObject("message", "alert('사용하실 수 없는 아이디입니다.')");
			}else {
				page = "studentjoin";
				mav.addObject("id", member.getId());
				mav.addObject("identity", "2");
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

			mb = dao.stIdFind(member);
			if(mb.getId().equals(null)) {
				page = "login";
				mav.addObject("identity", "2");
				mav.addObject("message", "alert('아이디가 없습니다.')");
			}else {
				page = "login";
				mav.addObject("identity", "2");
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

			member.setStudentCode(((String)session.getAttribute("stCode")));

			member.setLogType(-1);

			if(dao.stLogout(member) != 0) {
				session.removeAttribute("stCode");
				session.removeAttribute("identity");
				page = "home";
				mav.addObject("message", "alert('로그아웃 되셨습니다.')");
				transaction = true;
			}else {
				session.removeAttribute("stCode");
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

			member.setStudentCode((String)session.getAttribute("stCode"));

			member.setPwd(enc.encode(member.getPwd()));	// 보안비밀번호

			if(dao.stInformationChange(member) != 0) {

				// 학년반번호 바꾸게 되면 추가

				page = null;
				mav.addObject("message", "alert('나의 정보 수정 되었습니다.')");
				transaction = true;
			}else {
				page = null;
				mav.addObject("message", "alert('나의 정보 수정 실패 되셨습니다.')");
				transaction = true;
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
			member.setStudentCode((String)session.getAttribute("stCode"));

			// 회원정보와 로그 기록은 남긴다.(단 회원정보에 상태코드 update 하여 탈퇴로 변경해주자!)

			if(dao.stmemberDelete(member) != 0) {

				// 다른 테이블도 delete 시켜줘야함

				session.removeAttribute("stCode");
				session.removeAttribute("identity");
				page = "home";
				mav.addObject("message", "alert('회원탈퇴 되셨습니다.')");
				transaction = true;
			}else {
				session.removeAttribute("stCode");
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
	private ModelAndView learningJoin(LearningRoomBean room) {	// 학습방 참여 및 조회

		mav = new ModelAndView();

		boolean transaction = false;
		String page = null;
		ArrayList<LearningRoomBean> al = new ArrayList<LearningRoomBean>();
		StringBuffer sb = new StringBuffer();

		setTransactionConf(TransactionDefinition.PROPAGATION_REQUIRED,TransactionDefinition.ISOLATION_READ_COMMITTED,false);

		try {

			if(room.getRoomCode() == null) {	// 조회

				if(dao.tclearningRoomCheck(room) != 0) {
					al = dao.learningGet(room);	// 이게 맞나? ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ

					for(int i=0; i < al.size(); i++) {
						sb.append("<input type='button' value='"+al.get(i).getRoomName()+"' "
								+ "onClick=learningJoin('"+al.get(i).getRoomCode()+"') />");
					}

					mav.addObject("id", room.getId());
					mav.addObject("content", sb.toString());
					page = "";
				}else {
					mav.addObject("message", "alert('선생님의 학습방이 없거나 잘못된 아이디 입니다..')");
					page = "";
				}

			}else {	// 인설트

				room.setStudentCode((String)session.getAttribute("stCode"));

				if(dao.stLearningJoin(room) != 0) {
					page = "studentMain";
					mav.addObject("message", "alert('학습방에 참여 되셨습니다.')");
					transaction = true;

					// 동적으로 과목 보여줘야함

				}else {
					page = "studentMain";
					mav.addObject("message", "alert('학습방에 참여 하실 수 없습니다.')");
					transaction = true;
				}

			}

		}catch(Exception ex) {

		}finally {
			mav.setViewName(page);
			setTransactionResult(transaction);
		}

		return mav;
	}

}
