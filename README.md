# **Notifications Pipeline with Firebase, Flask, MySQL & Analytics**

## **Project Overview**
This project **builds an end-to-end pipeline** for handling notifications using **Firebase Cloud Messaging**, **Flask API**, **MySQL database**, 
and data analytics. It covers the process of **generating, storing, and analyzing** notifications for valuable insights.

---

## **Workflow**
1.Send Notifications 📢 – Notifications are generated and sent using Firebase Cloud Messaging through the Firebase Admin SDK, mimicking the functionality of Instagram-like notifications.
2.Store Notifications 💾 – Notifications are saved to a MySQL database via a Flask API, making them easily accessible for further processing.
3.Analyze Notifications 📊 – The stored notifications are analyzed to extract trends, patterns, and insights.

---

# **Project Structure**
```

Notifications-Pipeline
│── Python   
│   │── backend
│       ├── app_n.py                # Flask API for storing notifications in MySQL       
│       ├── send_notification.py    # Sends notifications via Firebase Admin SDK       
│
│   │── frontend       
│       ├── index.html              # Web interface for enabling notifications      
│       ├── firebase-messaging-sw.js # Service Worker for background notifications       
│
│── SQL
│   ├── schema.sql       # Creating a table to save in database
|   ├── data_analytics.sql  #Performing a analytics on data

```

---

---


## **Technologies Used**
- **Python 🐍** – Backend API built with Flask & Firebase Admin SDK
- **Firebase 🔥** – Cloud messaging platform for sending push notifications
- **MySQL 🛢️** – Database used for storing notifications
- **JavaScript 📜** – Frontend logic and Service Worker for handling background notifications

---

## **Key Features**
- ✅ **Push notifications with Firebase Cloud Messaging for real-time updates**
- ✅ **Flask API to handle the backend integration**
- ✅ **MySQL database for reliable storage of notification data**
- ✅ **Service Worker implementation for managing background notifications in the browser**
- ✅ **Dummy data integration to facilitate efficient analytics and testing**

---

## **Topics Covered**
- ✅ **Flask API Development**
- ✅ **Firebase Cloud Messaging Integration**
- ✅ **MySQL Database Design & Management**
- ✅ **Foreground & Background Notification Handling**
- ✅ **Frontend Integration with JavaScript & Service Workers**
- ✅ **Data Storage and Analysis Setup for Insights**

---

>**Note**: This project provides a complete **pipeline** for notification management, combining **backend**, **frontend**, and data **storage** in a scalable way, ready for **future analytics** and enhancements.
