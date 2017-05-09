Config.destroy_all

Config.create!(
  mail_from: "duo.stockholm@manniskohjalp.se",
  follow_up_mail_subject: "Duo Stockholm – 1 månad",
  follow_up_mail_content: %{Hej {newcomer} och {established},

Hoppas ni mår bra. Vi ville bara skriva och höra hur första månaden i Duo Stockholm har gått?

Har ni haft möjlighet att träffas?

Berätta gärna vad ni gjort. Har ni tagit något foto så skicka gärna. Det är kul att höra och se hur det går för er :)

Ha en bra dag,
Jonathan och Zuraiya

--
Duo Stockholm}
)
