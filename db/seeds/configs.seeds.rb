Config.destroy_all

Config.create!(
  mail_from: "no-reply@example.com",
  follow_up_mail_subject: "How are you doing?",
  follow_up_mail_content: "Hello {newcomer} and {established}, it's been a month since...",
  conclusion_mail_subject: "Thank you for participating",
  conclusion_mail_content_for_newcomer: "Hello {name}, please tell us about your experience as a newcomer...",
  conclusion_mail_content_for_established: "Hello {name}, please tell us about your experience as an established..."
)
