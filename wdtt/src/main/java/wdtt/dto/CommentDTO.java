package wdtt.dto;

import java.util.Date;

public class CommentDTO {
	private int comment_num;
	private int news_num;
	private String writer;
	private String content; 
	private Date join_date;
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getNews_num() {
		return news_num;
	}
	public void setNews_num(int news_num) {
		this.news_num = news_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "CommentDTO [comment_num=" + comment_num + ", news_num=" + news_num + ", writer=" + writer + ", content="
				+ content + ", join_date=" + join_date + "]";
	}
	public CommentDTO(int comment_num, int news_num, String writer, String content, Date join_date) {
		super();
		this.comment_num = comment_num;
		this.news_num = news_num;
		this.writer = writer;
		this.content = content;
		this.join_date = join_date;
	}
	public CommentDTO() {
	
	}
	
	
	
	
	
}
