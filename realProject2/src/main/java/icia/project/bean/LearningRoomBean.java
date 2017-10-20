package icia.project.bean;

import org.apache.ibatis.type.Alias;

@Alias("room")
public class LearningRoomBean {	// 학습방 bean
	
	private String studentCode; // 학생학년반번호
	private String id;	// 아이디
	private String roomCode;	// 방코드
	private String roomName;	// 방이름
	private String roomIntroduction;	// 방소개
	
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomIntroduction() {
		return roomIntroduction;
	}
	public void setRoomIntroduction(String roomIntroduction) {
		this.roomIntroduction = roomIntroduction;
	}
	


}
