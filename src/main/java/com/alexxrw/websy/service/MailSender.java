package com.alexxrw.websy.service;

import com.alexxrw.websy.events.SendMailEvent;
import com.google.common.eventbus.Subscribe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import static com.google.common.base.Preconditions.checkArgument;
import static com.google.common.base.Preconditions.checkNotNull;
import static org.springframework.util.StringUtils.isEmpty;

@Service
public class MailSender {

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String username;

    @Subscribe
    public void send(SendMailEvent event){
        checkArgument(!isEmpty(event.getEmailTo()), "Email cannot be empty");
        checkArgument(!isEmpty(event.getSubject()), "Subject cannot be empty");
        checkArgument(!isEmpty(event.getMessage()), "Message cannot be empty");

        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setFrom(username);
        mailMessage.setTo(event.getEmailTo());
        mailMessage.setSubject(event.getSubject());
        mailMessage.setText(event.getMessage());

        mailSender.send(mailMessage);
    }
}
