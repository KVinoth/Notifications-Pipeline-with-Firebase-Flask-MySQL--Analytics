importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js');

// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyBSauouVgklywG0XgkBygFhN7KIYMVHmwo",
  authDomain: "notifications-6df07.firebaseapp.com",
  projectId: "notifications-6df07",
  storageBucket: "notifications-6df07.firebasestorage.app",
  messagingSenderId: "130263294118",
  appId: "1:130263294118:web:4757ceb6dec7bb009f1467",
  measurementId: "G-Q0JLQBR9B2"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Handle background notifications
messaging.onBackgroundMessage((payload) => {
    console.log('[firebase-messaging-sw.js] Received background message:', payload);

    const notificationTitle = payload.notification?.title || 'Background Notification';
    const notificationBody = payload.notification?.body || 'Background Body';

    // Display the notification
    self.registration.showNotification(notificationTitle, {
        body: notificationBody,
        icon: payload.notification?.icon || '/default-icon.png',
    });

    // Send notification data to backend for MySQL storage
    fetch('http://localhost:5000/store-notification', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            title: notificationTitle,
            body: notificationBody,
            type: 'background', // Indicate background notification
            source: 'Instagram', // Example source
        }),
    })
        .then((response) => response.json())
        .then((data) => console.log('Notification stored in MySQL:', data))
        .catch((error) => console.error('Error storing notification in MySQL:', error));
});
