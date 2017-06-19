class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  def sendmail_picture(picture)
    @picture = picture
    mail to: "ryo.kazama1023@gmail.com",
      subject: '[大課題２]写真が投稿されました'
  end
end
