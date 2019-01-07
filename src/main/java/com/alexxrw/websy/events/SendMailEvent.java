package com.alexxrw.websy.events;

public class SendMailEvent {

    private String emailTo;
    private String subject;
    private String message;

    public SendMailEvent(String emailTo, String subject, String message) {
        this.emailTo = emailTo;
        this.subject = subject;
        this.message = message;
    }

    public String getEmailTo() {
        return emailTo;
    }

    public String getSubject() {
        return subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
