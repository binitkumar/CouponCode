require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "referal" do
    mail = Notification.referal
    assert_equal "Referal", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
