# DreamVibe: Predicting Sleep Quality Using Daily Physical Activities

## Overview

DreamVibe is a pioneering research initiative aimed at exploring the intricate relationship between daily physical activities and sleep quality. Utilizing advanced machine learning algorithms, DreamVibe offers predictive insights into sleep quality based on meticulously recorded parameters such as step count, caloric burn, and duration of deep sleep, acquired through wearable technology. 

The project capitalizes on data from two distinct sources: a longitudinal dataset from a single user spanning 2450 days and a cross-sectional dataset from 30 users over a one-week period. This dual approach allows for a comprehensive analysis, mitigating potential biases caused by various factors such as age, gender, and lifestyle.

Key findings of the research highlight a positive relationship between physical activity and sleep quality, underscoring the significance of an active lifestyle in promoting better sleep health. Moreover, the research introduces a novel ensemble technique, enhancing predictive performance by combining the strengths of both personalized and generalized machine learning models. This not only augments the reliability of the sleep quality score but also introduces a layer of adaptability, allowing the model to be fine-tuned based on real-world validation or as more data becomes available.

DreamVibe's implications are far-reaching, offering valuable insights and practical guidance for healthcare professionals, fitness enthusiasts, and researchers in the domain of sleep studies. Furthermore, the project paves the way for the development of targeted interventions aimed at enhancing sleep quality, thereby making a significant contribution to the broader field of sleep research and public health.

The project consists of data processing scripts, datasets, and a cross-platform mobile application, ensuring a comprehensive toolkit for anyone interested in the confluence of sleep quality, physical activity, and machine learning.



## Contents
- `scripts/`: Contains all the data processing and machine learning scripts.
- `datasets/`: Includes the datasets used in the project.
- `mobile_app/`: The Flutter application code.

## Dataset

The DreamVibe project utilizes two meticulously curated datasets to explore the relationship between daily physical activities and sleep quality. The datasets were obtained from smartwatches and wearable devices, ensuring a high level of accuracy and detail. Here is an overview of each dataset:

### Single User Dataset
- **Source:** Data collected from a single individual over a period of 2450 days.
- **Features:** Includes daily metrics such as total steps taken, total distance covered, calories burned, and detailed sleep data (total sleep time, total time in bed, and deep sleep time).
- **Preprocessing:** The dataset underwent rigorous preprocessing to ensure quality. Steps included handling missing values, removing outliers, and normalizing the data for consistent analysis.

### 30-Users Dataset
- **Source:** Data compiled from 30 individuals, collected over a span of one week.
- **Features:** Similar to the single user dataset, it includes daily activity metrics and sleep data. The inclusion of multiple users provides a broader perspective, allowing for a more comprehensive analysis.
- **Preprocessing:** Similar preprocessing steps were applied to this dataset to maintain consistency and data integrity across the study.

### Preprocessing Details
- **Date Alignment:** All datasets were aligned based on the date field to ensure consistency in temporal analysis.
- **Missing Values:** Missing values were carefully handled either by removal or by imputation, depending on the nature and extent of the missing data.
- **Outlier Detection and Removal:** Outliers were identified using statistical methods and were removed to prevent them from skewing the results.
- **Normalization:** Data was normalized to ensure that the scales of different features do not bias the machine learning models.

These datasets serve as the backbone of the DreamVibe project, allowing for an in-depth exploration of the factors that influence sleep quality. Through meticulous preprocessing and structured analysis, the project aims to uncover valuable insights that contribute to the understanding of sleep patterns in relation to physical activity.


## Machine Learning Models

In its quest to accurately predict sleep quality based on daily physical activities, the DreamVibe project undertook a rigorous exploration of various machine learning models. The objective was to identify the model that offers the best performance in terms of accuracy, reliability, and efficiency. Here's an overview of the process and the final model selection:

### Model Exploration
- **Multiple Models Evaluated:** The project initially experimented with several machine learning models, including Linear Regression, Decision Trees, Gradient Boosting, and Random Forest, among others. Each model was thoroughly evaluated to understand its strengths and weaknesses in the context of sleep quality prediction.
- **Performance Metrics:** Models were assessed based on key performance metrics, such as RMSE (Root Mean Squared Error) and R² (Coefficient of Determination). The evaluation process was meticulous, ensuring a comprehensive analysis of each model's predictive capabilities.

### Model Selection
- **Random Forest - The Chosen Model:** After extensive testing and comparison, the Random Forest model emerged as the superior choice. It distinguished itself through its robustness, ability to handle complex nonlinear relationships, and feature importance analysis, making it highly suitable for the nuanced task of predicting sleep quality from diverse activity data.

### TensorFlow Random Forest Model
- **Training with TensorFlow:** Embracing the TensorFlow framework, the project utilized TensorFlow Decision Forests to train the Random Forest model. This approach harnesses the power of TensorFlow to streamline model training, evaluation, and deployment, particularly for mobile applications.
- **Model Conversion and Optimization:** The trained Random Forest model was converted into the TensorFlow Lite format, optimizing it for high performance in mobile environments. This conversion ensures that the model is lightweight, requires minimal computational resources, and provides rapid, real-time predictions on users' devices.

### Integration into the Mobile Application
- **Seamless Model Integration:** The TensorFlow Lite model is seamlessly integrated into the DreamVibe Flutter-based mobile application. Users benefit from immediate and intuitive sleep quality predictions, grounded in their daily physical activity data sourced from Google Fit or Apple Health.
- **User-Centric Design:** The integration is designed with a focus on user experience, ensuring that the model's predictions are presented in an accessible and actionable manner. This empowers users to make informed decisions about their lifestyle and sleep habits, fostering a proactive approach to improving sleep quality.

The selection and integration of the TensorFlow Random Forest model underscore the DreamVibe project's commitment to leveraging cutting-edge machine learning techniques to enhance individual well-being. The project stands as a testament to the synergy between sophisticated data analysis and practical, user-friendly application.


## Mobile Application

The DreamVibe project extends its capabilities into the hands of users through a sophisticated mobile application built with Flutter. The application is designed to be intuitive, user-friendly, and provides real-time predictions on sleep quality based on daily physical activities. Here are the key features and functionalities of the mobile application:

### Integration with Health Data
- **Google Fit and Apple Health Integration:** The DreamVibe app seamlessly integrates with Google Fit (for Android users) and Apple Health (for iOS users). This integration allows the app to access a user's daily physical activity data, including steps taken, distance covered, and calories burned.
- **Data Privacy and Security:** The app ensures that all health data retrieved from Google Fit or Apple Health is securely handled and that user privacy is maintained. Users have full control over what data the app can access.

### Sleep Quality Prediction
- **TensorFlow Lite Model:** The app incorporates the TensorFlow Lite model, allowing for efficient and effective sleep quality predictions directly on the user's device. This ensures a smooth and responsive user experience without the need for constant internet connectivity.
- **Real-Time Analysis:** Users receive real-time predictions on their sleep quality based on the latest activity data retrieved from Google Fit or Apple Health. This allows users to gain immediate insights into how their daily activities might be affecting their sleep.

### User Interface and Experience
- **Intuitive Design:** The DreamVibe app boasts an intuitive and user-friendly interface, ensuring that users can easily navigate through the app and understand their sleep quality predictions.
- **Personalized Insights:** The app not only provides predictions on sleep quality but also offers personalized insights and recommendations, empowering users to make informed decisions about their lifestyle and sleep habits.

### Future Enhancements
- **Feedback Loop:** Future versions of the app may include a feedback mechanism where users can rate their actual sleep quality. This data can be invaluable in further refining and enhancing the predictive model.
- **Expanded Health Metrics:** The integration with Google Fit and Apple Health opens up possibilities for incorporating more health metrics into the analysis, providing a more holistic view of a user's well-being.

The DreamVibe mobile application is more than just an interface—it's a comprehensive tool that puts the power of advanced machine learning models in the pockets of users, promoting better sleep health through data-driven insights.
