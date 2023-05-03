package wdtt.dto;

import java.util.Date;

public class WdttNewsDTO {
	private int num; //게시물번호
	private String writer; //글쓴이 wdtt/userid와 외래키
	private Date join_date; //올린날
	private String title; //제목
	private int readcount; //조회수
	private String content; //본문
	private String filename;
	private int filesize;
	private String ext; //첨부파일의 확장자, 테이블에는 없음
	private String show;
	private String comment_count;//댓글개수
	
	
	
	public WdttNewsDTO(int num, String writer, Date join_date, String title, int readcount, String content,
			String filename, int filesize, String ext, String show, String comment_count) {
		super();
		this.num = num;
		this.writer = writer;
		this.join_date = join_date;
		this.title = title;
		this.readcount = readcount;
		this.content = content;
		this.filename = filename;
		this.filesize = filesize;
		this.ext = ext;
		this.show = show;
		this.comment_count = comment_count;
	}
	@Override
	public String toString() {
		return "WdttNewsDTO [num=" + num + ", writer=" + writer + ", join_date=" + join_date + ", title=" + title
				+ ", readcount=" + readcount + ", content=" + content + ", filename=" + filename + ", filesize="
				+ filesize + ", ext=" + ext + ", show=" + show + ", comment_count=" + comment_count + "]";
	}
	public String getComment_count() {
		return comment_count;
	}
	public void setComment_count(String comment_count) {
		this.comment_count = comment_count;
	}
	//게더세더,. ...
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public WdttNewsDTO() {
		
	}

	
	
	
	
	
	
}
	
	