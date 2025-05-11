package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.example.demo.model.Crenaux;
import com.example.demo.model.ReservationRequest;
import com.example.demo.model.Spectacle;
import com.example.demo.repository.SpectacleRepository;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private SpectacleRepository sprepo;

    public void sendReservationConfirmation(String to, ReservationRequest req, Spectacle spec) {
        MimeMessage msg = mailSender.createMimeMessage();
        Crenaux crn=sprepo.getCrenaux(req.getIdSpec(),req.getIdDateLieu() );
        try {
            MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
            helper.setTo(to);
            helper.setSubject("Confirmation de votre réservation");
            String body = new StringBuilder()
                .append("Bonjour <b>").append(req.getPrenomClt()).append(" ").append(req.getNomClt()).append("</b>,<br><br>")
                .append("Votre réservation est <b>confirmée</b> :<br>")
                .append("• Spectacle : ").append(spec.getTitre()).append("<br>")
                .append("• Créneau : ").append("<br>").append(crn.getDatecrn()).append("<br>").append(crn.getNomlieu()).append("<br>").append(crn.getVille()).append("<br>").append(crn.getAdrss()).append("<br>") // ou formatez la date
                .append("• Catégorie : ").append(req.getCategorieTckt()).append("<br>")
                .append("• Quantité : ").append(req.getQte()).append("<br>")
                .append("• Total payé : <b>").append(req.getPrixpaye()).append(" DT</b><br><br>")
                .append("Merci et à bientôt!")
                .toString();
            helper.setText(body, true);
            mailSender.send(msg);
        } catch (MessagingException e) {
            throw new IllegalStateException("Erreur lors de l’envoi de mail", e);
        }
    }
}

