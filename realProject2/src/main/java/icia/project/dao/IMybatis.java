package icia.project.dao;

import java.util.ArrayList;

import icia.project.bean.MemberBean;
import icia.project.bean.LearningRoomBean;

public interface IMybatis {

	// 선생님 아이디 체크
	public int tcIdCheck(MemberBean member);

	// 선생님 임시비밀번호 추출
	public MemberBean tcPwdGet(MemberBean member);

	// 학생 아이디 체크
	public int stIdCheck(MemberBean member);

	// 학생코드 체크
	public int stCodeCheck(MemberBean member);

	// 학생 임시비밀번호 추출
	public MemberBean stPwdGet(MemberBean member);

	// 학생코드 추출
	public MemberBean stCodeGet(MemberBean member);

	// 선생님 회원가입
	public int tcJoin(MemberBean member);

	// 학생 회원가입
	public int stJoin(MemberBean member);

	// 선생님 아이디 찾기
	public MemberBean tcIdFind(MemberBean member);

	// 학생 아이디 찾기
	public MemberBean stIdFind(MemberBean member);

	// 선생님 로그인 히스토리
	public int tcLogHistory(MemberBean member);

	// 학생 로그인 히스토리
	public int stLogHistory(MemberBean member);

	// 선생님 로그아웃
	public int tcLogout(MemberBean member);

	// 학생 로그아웃
	public int stLogout(MemberBean member);

	// 선생님 나의정보 수정
	public int tcInformationChange(MemberBean member);

	// 학생 나의정보 수정
	public int stInformationChange(MemberBean member);

	// 선생님 회원탈퇴
	public int tcmemberDelete(MemberBean member);

	// 학생 회원탈퇴
	public int stmemberDelete(MemberBean member);

	// 선생님 학습코드 유무
	public int tclearningCodeCheck(LearningRoomBean room);

	// 학습방 유무
	public int tclearningRoomCheck(LearningRoomBean room);

	// 선생님 학습 개설
	public int tclearningOpen(LearningRoomBean room);

	// 학습방 추출
	public ArrayList<LearningRoomBean> learningGet(LearningRoomBean room);

	// 학생 학습참여
	public int stLearningJoin(LearningRoomBean room);
}
