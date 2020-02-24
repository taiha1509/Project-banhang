package com.laptrinhjavaweb.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

public abstract class BaseEntity {
	private static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	@Column(name = "status", nullable = false)
	private boolean status;

	@Column(name = "CreatedByUserId")
	private int createdByUserId;

	@Column(name = "UpdatedByUserID")
	private int updatedByUserID;

	@Column(name = "create_time")
	private LocalDateTime create_time;

	@Column(name = "update_time")
	private LocalDateTime update_time;

	public String getStringCreateDateTime() {
		if (create_time == null)
			return LocalDateTime.now().format(formatter);
		return create_time.format(formatter);
	}

	// ::: save
	@PrePersist
	private void onInsert() {
		this.create_time = LocalDateTime.now();
	}

	// ::: update
	@PreUpdate
	private void onUpdate() {
		this.update_time = LocalDateTime.now();
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getCreatedByUserId() {
		return createdByUserId;
	}

	public void setCreatedByUserId(int createdByUserId) {
		this.createdByUserId = createdByUserId;
	}

	public int getUpdatedByUserID() {
		return updatedByUserID;
	}

	public void setUpdatedByUserID(int updatedByUserID) {
		this.updatedByUserID = updatedByUserID;
	}

	public LocalDateTime getCreate_time() {
		return create_time;
	}

	public void setCreate_time(LocalDateTime create_time) {
		this.create_time = create_time;
	}

	public LocalDateTime getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(LocalDateTime update_time) {
		this.update_time = update_time;
	}
	
	
}
