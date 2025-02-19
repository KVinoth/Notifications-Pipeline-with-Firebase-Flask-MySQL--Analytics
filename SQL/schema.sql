CREATE TABLE notifications (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
body TEXT NOT NULL,
type ENUM('foreground', 'background') NOT NULL,
source VARCHAR(50) DEFAULT 'Instagram', 
received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO notifications (title, body, type, source, received_at) VALUES
('Order Confirmed', 'Your order #1234 has been confirmed.', 'foreground', 'PickMe', NOW()),
('New Discount', 'Get 20% off on your next order!', 'background', 'PickMe', NOW() - INTERVAL 2 DAY),
('Payment Successful', 'Your payment of $15.99 has been processed.', 'foreground', 'PickMe', NOW() - INTERVAL 1 DAY),
('Order Dispatched', 'Your order is out for delivery.', 'foreground', 'PickMe', NOW() - INTERVAL 5 HOUR),
('Follow Request', 'User123 has requested to follow you.', 'background', 'Instagram', NOW() - INTERVAL 3 DAY),
('Message Received', 'You have a new message from User456.', 'foreground', 'Instagram', NOW() - INTERVAL 1 HOUR),
('Live Stream Alert', 'Your favorite creator is live now!', 'background', 'Instagram', NOW() - INTERVAL 30 MINUTE),
('Review Reminder', 'Rate your recent order and get bonus points.', 'background', 'PickMe', NOW() - INTERVAL 1 DAY);
('Order Confirmed', 'Your order #1234 has been confirmed.', 'foreground', 'PickMe', NOW() - INTERVAL 10 MINUTE),
('New Message', 'You have a new message from John Doe.', 'foreground', 'WhatsApp', NOW() - INTERVAL 5 MINUTE),
('Payment Failed', 'Your payment attempt for order #1234 failed. Please try again.', 'foreground', 'PickMe', NOW() - INTERVAL 20 MINUTE),
('Like Received', 'Your post received 50 likes.', 'background', 'Instagram', NOW() - INTERVAL 1 HOUR),
('New Follow Request', 'User123 has requested to follow you.', 'background', 'Instagram', NOW() - INTERVAL 1 HOUR),
('Event Reminder', 'Don’t miss the Webinar on Data Science tomorrow at 5 PM.', 'foreground', 'LinkedIn', NOW() - INTERVAL 2 HOUR),
('Order Out for Delivery', 'Your order #1256 is out for delivery.', 'foreground', 'PickMe', NOW() - INTERVAL 30 MINUTE),
('Delivery Arrived', 'Your order #1234 has been delivered.', 'foreground', 'PickMe', NOW() - INTERVAL 40 MINUTE),
('New Follower Alert', 'You have gained a new follower on Twitter.', 'background', 'Twitter', NOW() - INTERVAL 3 HOUR),
('Promo Code Available', 'Use promo code BIGDISCOUNT for 20% off!', 'background', 'PickMe', NOW() - INTERVAL 1 DAY),
('Payment Successful', 'Your payment of $15.99 for order #1256 has been processed.', 'foreground', 'PayPal', NOW() - INTERVAL 1 DAY),
('Order Canceled', 'Order #1223 has been canceled due to unavailable items.', 'background', 'PickMe', NOW() - INTERVAL 2 DAY),
('Friend Request', 'Alice has sent you a friend request on Facebook.', 'background', 'Facebook', NOW() - INTERVAL 2 DAY),
('New Story Post', 'Your story has been posted successfully on Instagram.', 'foreground', 'Instagram', NOW() - INTERVAL 5 DAY),
('Review Request', 'Please rate your recent experience with order #1256.', 'background', 'PickMe', NOW() - INTERVAL 6 DAY),
('App Update', 'A new version of the app is available for download.', 'foreground', 'Twitter', NOW() - INTERVAL 7 DAY),
('Discount Available', 'Flash Sale! 30% off on selected items. Hurry!', 'background', 'PickMe', NOW() - INTERVAL 8 DAY),
('Referral Reward', 'You earned $10 for referring a friend to Uber Eats!', 'background', 'Uber Eats', NOW() - INTERVAL 10 DAY),
('Delivery Delay', 'Your order #1256 is delayed. We apologize for the inconvenience.', 'foreground', 'PickMe', NOW() - INTERVAL 12 DAY),
('Account Suspended', 'Your account has been suspended due to suspicious activity.', 'background', 'Twitter', NOW() - INTERVAL 15 DAY),
('Privacy Policy Update', 'Our privacy policy has been updated. Please review it.', 'foreground', 'Facebook', NOW() - INTERVAL 20 DAY);


SELECT * FROM notifications;